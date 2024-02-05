import { useEffect, useState } from "react";
import Pharmacy from "./Pharmacy";

function Pharmacies() {
  const [pharmacies, setPharmacies] = useState([]);

  useEffect(() => {
    fetch("https://localhost:7099/Pharmacy")
      .then((response) => response.json())
      .then((data) => setPharmacies(data));
  }, []);

  const updatePharmacy = (updatedPharmacy) => {
    setPharmacies(
      pharmacies.map((pharmacy) =>
        pharmacy.pharmacyId === updatedPharmacy.pharmacyId
          ? updatedPharmacy
          : pharmacy
      )
    );
  };
  return (
    <div className="pharmacies">
      <h1>Pharmacies</h1>
      {pharmacies.map((pharmacy) => (
        <Pharmacy key={pharmacy.pharmacyId} {...pharmacy} updatePharmacy={updatePharmacy} />
      ))}
    </div>
  );
}

export default Pharmacies;
