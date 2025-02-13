using dogadjaj_ba.Model;
using dogadjaj_ba.Services;
using dogadjaj_ba.Services.Database;
using Microsoft.ML;
using Microsoft.ML.Data;
using Microsoft.ML.Trainers;
using System;
using System.Collections.Generic;
using System.Linq;

public class EventRecommendationService :  IEventRecommendationService
{
    private static readonly object isLocked = new object();
    private static MLContext? mlContext = null;
    private static ITransformer? model = null;
    private readonly Ib190074DogadjaBaContext _context;

    public EventRecommendationService(Ib190074DogadjaBaContext context)
    {
        _context = context;
    }

    public List<dogadjaj_ba.Model.Event> GetRecommendedEvents()
    {
        try
        {
            lock (isLocked)
            {
                if (mlContext == null)
                {
                    mlContext = new MLContext();
                    var data = new List<EventEntry>();

                    try
                    {
                        // 🔹 Dohvati evente iz baze
                        var eventViews = _context.Events
                            .Select(e => new
                            {
                                EventId = e.EventId,
                                EventName = e.EventName,
                                EventDate = e.EventDate,
                                ViewCount = e.ViewCount 
                            })
                            .ToList();

                   

                        foreach (var ev in eventViews)
                        {
                            data.Add(new EventEntry
                            {
                                EventId = (uint)ev.EventId,
                                PopularityScore = (float)ev.ViewCount
                            });
                        }
                    }
                    catch (Exception ex)
                    {
                  
                        throw;
                    }

                    if (!data.Any())
                    {
               
                    }

                    try
                    {
                        var trainData = mlContext.Data.LoadFromEnumerable(data);
                        var trainTestSplit = mlContext.Data.TrainTestSplit(trainData, testFraction: 0.2);

                        var options = new MatrixFactorizationTrainer.Options
                        {
                            MatrixColumnIndexColumnName = nameof(EventEntry.EventId),
                            MatrixRowIndexColumnName = nameof(EventEntry.EventId),
                            LabelColumnName = "PopularityScore",
                            LossFunction = MatrixFactorizationTrainer.LossFunctionType.SquareLossOneClass,
                            Alpha = 0.01,
                            Lambda = 0.025
                        };

                        var trainer = mlContext.Recommendation().Trainers.MatrixFactorization(options);
                        model = trainer.Fit(trainTestSplit.TrainSet);

                        if (model == null)
                        {
                      
                        }
                    }
                    catch (Exception ex)
                    {
                     
                        throw;
                    }
                }
            }

            var predictionResult = new List<Tuple<dogadjaj_ba.Services.Database.Event, float>>();

            try
            {
                var events = _context.Events.ToList();
                Console.WriteLine($"✅ Ukupno evenata u bazi: {events.Count}");

                foreach (var ev in events)
                {
                    var predictionEngine = mlContext.Model.CreatePredictionEngine<EventEntry, EventPrediction>(model);
                    var prediction = predictionEngine.Predict(new EventEntry()
                    {
                        EventId = (uint)ev.EventId,
                        PopularityScore = 0
                    });

                    predictionResult.Add(new Tuple<dogadjaj_ba.Services.Database.Event, float>(ev, prediction.Score));
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"❌ Greška pri predviđanju evenata: {ex.Message}");
                throw;
            }

            var finalResult = predictionResult
                .OrderByDescending(x => x.Item2)
                .Select(x => x.Item1)
                .Take(3)
                .ToList();

           

            return finalResult.Select(e => new dogadjaj_ba.Model.Event
            {
                EventId = e.EventId,
                EventName = e.EventName,
                EventDate = e.EventDate
            }).ToList();
        }
        catch (Exception ex)
        {
            Console.WriteLine($"❌ Fatalna greška u GetRecommendedEvents: {ex.Message}");
            return new List<dogadjaj_ba.Model.Event>(); 
        }
    }


    public class EventEntry
    {
        [KeyType(count: 1000)]  
        public uint EventId { get; set; }
        public float PopularityScore { get; set; }
    }

    public class EventPrediction
    {
        public float Score { get; set; }
    }
}
