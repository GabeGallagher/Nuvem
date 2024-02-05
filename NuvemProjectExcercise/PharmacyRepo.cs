using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace NuvemProjectExcercise
{
    public class PharmacyRepo
    {
        private PharmacyContext context;

        public PharmacyRepo(PharmacyContext context)
        {
            this.context = context;
        }

        public async Task<IEnumerable<Pharmacy>> GetPharmacies()
        {
            return await this.context.Pharmacies.ToListAsync();
        }

        public async Task<Pharmacy> GetPharmacyById(int pharmacyId)
        {
            var pharmacy =  await this.context.Pharmacies.FindAsync(pharmacyId);
            if (pharmacy == null)
            {
                throw new KeyNotFoundException("A Pharmacy with the following key: " +  pharmacyId + " was not found"); 
            }
            return pharmacy;
        }

        public async Task<Pharmacy> UpdatePharmacy(int pharmacyId, Pharmacy pharmacy)
        {
            if (pharmacy == null || pharmacy.PharmacyId != pharmacyId)
                return null;

            var existingPharmacy = await this.context.Pharmacies.FindAsync(pharmacyId);

            if (existingPharmacy == null)
                return null;

            this.context.Entry(existingPharmacy).CurrentValues.SetValues(pharmacy);

            await this.context.SaveChangesAsync();
            
            return pharmacy;
        }
    }
}
