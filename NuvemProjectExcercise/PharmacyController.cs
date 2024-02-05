using Microsoft.AspNetCore.Mvc;

namespace NuvemProjectExcercise
{
    [ApiController]
    [Route("[controller]")]
    public class PharmacyController : ControllerBase
    {
        private PharmacyRepo repo;

        public PharmacyController(PharmacyRepo repo)
        {
            this.repo = repo;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Pharmacy>>> GetPharmacies()
        {
            var pharmacies = await this.repo.GetPharmacies();
            return Ok(pharmacies);
        }

        [HttpGet("{pharmacyId}")]
        public async Task<Pharmacy> GetPharmacyById([FromRoute] int pharmacyId)
        {
            return await this.repo.GetPharmacyById(pharmacyId);
        }

        [HttpPut("{pharmacyId}")]
        public async Task<IActionResult> UpdatePharmacy([FromRoute] int pharmacyId, [FromBody] Pharmacy pharmacy)
        {
            if (pharmacyId != pharmacy.PharmacyId)
                return BadRequest("Bad Request");

            var result = await this.repo.UpdatePharmacy(pharmacyId, pharmacy);
            if (result == null)
                return NotFound();

            return Ok(result);
        }
    }
}
