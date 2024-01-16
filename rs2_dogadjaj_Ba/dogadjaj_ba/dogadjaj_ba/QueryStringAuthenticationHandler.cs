using Azure.Core;
using dogadjaj_ba.Services;
using Microsoft.AspNetCore.Authentication;
using Microsoft.Extensions.Options;
using System.Security.Claims;
using System.Text.Encodings.Web;

namespace dogadjaj_ba
{
    public class QueryStringAuthenticationHandler : AuthenticationHandler<AuthenticationSchemeOptions>
    {
        protected readonly IUserService _userService;
        protected readonly ILogger _logger;
        public QueryStringAuthenticationHandler(IUserService userService, IOptionsMonitor<AuthenticationSchemeOptions> options, ILoggerFactory logger, UrlEncoder encoder, ISystemClock clock)
            : base(options, logger, encoder, clock)
        {
            _userService = userService;
            _logger = logger.CreateLogger<QueryStringAuthenticationHandler>();
        }

        protected override async Task<AuthenticateResult> HandleAuthenticateAsync()
        {

            if (!Request.Query.ContainsKey("KorisnickoIme"))
            {
                return AuthenticateResult.Fail("Missing username in the query string");
            }

            var username = Request.Query["KorisnickoIme"].ToString();
            var user = await _userService.GetUserById(username);
           // var user = await _userService.Login(username, password);
            if (user == null)
            {
                return AuthenticateResult.Fail("User not found");
            }

            var claims = new List<Claim>
        {
            new Claim(ClaimTypes.Name, user.ImePrezime),
            new Claim(ClaimTypes.NameIdentifier, user.KorisnickoIme)
            // Add more claims as needed
        };

            var identity = new ClaimsIdentity(claims, Scheme.Name);
            var principal = new ClaimsPrincipal(identity);
            var ticket = new AuthenticationTicket(principal, Scheme.Name);
            _logger.LogInformation("Authentication successful for user: {KorisnickoIme}", user.KorisnickoIme);
            return AuthenticateResult.Success(ticket);
        }
    }
}
