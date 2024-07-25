import React from 'react';
import bgImage from "../../logo.svg"
import ImageCard from "../ImageCard";
import css from './styles.css'
const CountryDetail = ({ country }) => {
  if (!country) {
    return <p>Selecione um país para ver os detalhes.</p>;
  }

  return (
    <ImageCard imgSrc={bgImage}>
      <h4 className="card-title">Nome do País: {country.name}</h4>
      <div className="card-text">
        <p>Capital: {country.capital}</p>
        <p>População: {country.population}</p>
        <p>Área: {country.area}</p>
      </div>

    </ImageCard>
  );
};

export default CountryDetail;