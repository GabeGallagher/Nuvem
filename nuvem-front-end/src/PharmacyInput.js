function PharmacyInput({ value, onChange, fieldName }) {
  return (
    <input type="text" value={value} onChange={(e) => onChange(e, fieldName)} />
  );
}

export default PharmacyInput;
