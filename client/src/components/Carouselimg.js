import Carousel from 'react-bootstrap/Carousel';

function Carouselimg() {
  return (
    <Carousel>
      <Carousel.Item interval={2000}>
        <img
          className='img1'
          src={"./img/img1.jpg"}
          alt="First slide"
        />
        <Carousel.Caption>
          <h1 className='sale'>Горячие блюда от 106 рублей!</h1>
          
        </Carousel.Caption>
      </Carousel.Item>
      <Carousel.Item interval={2000}>
        <img
           className='img1'
          src={"./img/image3.jpg"}
          alt="Second slide"
        />
        <Carousel.Caption>
        <h1 className='sale'>Скидка на ВСЮ выпечку после 20:00</h1>
        </Carousel.Caption>
      </Carousel.Item>
      <Carousel.Item interval={2000}>
        <img
          className='img1'
          src={"./img/img5.jpg"}
          alt="Third slide"
        />
        <Carousel.Caption>
        <h1 className='sale'>Скидка на ВЕСЬ ассортимент после 21:00</h1>
        </Carousel.Caption>
      </Carousel.Item>
    </Carousel>
  );
}

export default Carouselimg;