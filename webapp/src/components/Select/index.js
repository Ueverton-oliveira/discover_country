import React, { useState } from 'react';
import { useQuery, gql } from '@apollo/client';
import CountryDetail from './../CountryDetail';
import ReactFlagsSelect from 'react-flags-select';
import * as C from "./styles";
import {countrySelect} from "./styles";

const GET_COUNTRIES = gql`
  query GetCountries {
    countries {
      id
      name
      capital
      population
      area
    }
  }
`;

const Select = () => {
  const { loading, error, data } = useQuery(GET_COUNTRIES);
  const [selectedCountry, setSelectedCountry] = useState("");
  const handleCountrySelect = (countryCode) => {
    setSelectedCountry(countryCode);
  };

  const countryCodes = {
    "BR": "Brazil",
    "US": "United States",
    "IN": "India",
    "IT": "Italy",
    "FR": "France",
    "AR": "Argentina",
  };

  const getCodeFromCountryName = (countryName) => {
    const countryCode = Object.entries(countryCodes).find(([key, value]) => value === countryName)?.[0];
    return countryCode || null;
  };

  if (loading) return <p>Loading...</p>;
  if (error) return <p>Error: {error.message}</p>;

  const selectedCountryCode = data.countries.find(country => getCodeFromCountryName(country.name) === selectedCountry);

  return (
    <C.Container>
      <C.TitleSelect>Seleção de País</C.TitleSelect>
      <ReactFlagsSelect
        countries={data.countries.map(country => getCodeFromCountryName(country.name))} // Passa os códigos dos países como lista de países
        onSelect={handleCountrySelect}
        selected={selectedCountry}
        placeholder="Selecione o país"
      />
      {selectedCountry && (
        <div>
          <CountryDetail country={selectedCountryCode} />
        </div>
      )}
    </C.Container>
  );
};

export default Select;
