import css from './styles.css'

const ImageCard = ({ children, imgSrc, ...props }) => {
  return (
    <div
      {...props}
      className="card"
    >
      <img className="card-image" src={imgSrc} alt="Imagem do país" />
      <div>
        <div>{children}</div>
      </div>
    </div>
  );
}

export default ImageCard;