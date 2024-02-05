import { useState } from "react";
import "./Pharmacy.css";
import PharmacyInput from "./PharmacyInput";

function Pharmacy(pharmacy) {
  const [isOpen, setIsOpen] = useState(false);
  const [isEditing, setIsEditing] = useState(false);
  const [editData, setEditData] = useState({ ...pharmacy });

  const handleEdit = () => setIsEditing(true);
  const handleSave = async () => {
    try {
      const response = await fetch(
        `https://localhost:7099/Pharmacy/${editData.pharmacyId}`,
        {
          method: "PUT",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify(editData),
        }
      );
      if (response.ok) {
        pharmacy.updatePharmacy(editData);
        setIsEditing(false);
      } else {
        console.error("Failed to edit pharmacy");
      }
    } catch (error) {
      console.error("Network error: ", error);
    }
  };
  const handleClose = () => {
    setIsEditing(false);
    setIsOpen(false);
  };

  return (
    <div>
      <div onClick={() => setIsOpen(!isOpen)} className="pharmacy">
        {pharmacy.name}
      </div>
      {isOpen && (
        <div className="pharmacy-container">
          <div className="row-container">
            <p>Name</p>
            <p>Address</p>
            <p>City</p>
            <p>State</p>
            <p>Zip</p>
            <p>Prescriptions</p>
            {isEditing ? (
              <button type="button" onClick={handleSave}>
                Save
              </button>
            ) : (
              <button type="button" onClick={handleEdit}>
                Edit
              </button>
            )}
          </div>
          {isEditing ? (
            <div className="row-container">
              <PharmacyInput
                value={editData.name}
                fieldName="name"
                onChange={(e, field) =>
                  setEditData({ ...editData, [field]: e.target.value })
                }
              />
              <PharmacyInput
                value={editData.address}
                fieldName="address"
                onChange={(e, field) =>
                  setEditData({ ...editData, [field]: e.target.value })
                }
              />
              <PharmacyInput
                value={editData.city}
                fieldName="city"
                onChange={(e, field) =>
                  setEditData({ ...editData, [field]: e.target.value })
                }
              />
              <PharmacyInput
                value={editData.state}
                fieldName="state"
                onChange={(e, field) =>
                  setEditData({ ...editData, [field]: e.target.value })
                }
              />
              <PharmacyInput
                value={editData.zip}
                fieldName="zip"
                onChange={(e, field) =>
                  setEditData({ ...editData, [field]: e.target.value })
                }
              />
              <PharmacyInput
                value={editData.numFilledPrescriptions}
                fieldName="numFilledPrescriptions"
                onChange={(e, field) =>
                  setEditData({ ...editData, [field]: e.target.value })
                }
              />
              <button type="button" onClick={handleClose}>
                Cancel
              </button>
            </div>
          ) : (
            <div className="row-container">
              <p>{pharmacy.name}</p>
              <p>{pharmacy.address}</p>
              <p>{pharmacy.city}</p>
              <p>{pharmacy.state}</p>
              <p>{pharmacy.zip}</p>
              <p>{pharmacy.numFilledPrescriptions}</p>
              <button type="button" onClick={handleClose}>
                Close
              </button>
            </div>
          )}
        </div>
      )}
    </div>
  );
}

export default Pharmacy;
