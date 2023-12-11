import { Card, Col, Row } from 'react-bootstrap'
import { useNavigate } from 'react-router-dom'
import Image from "react-bootstrap/Image";

const ProductItem = ({data}) => {
    const navigate = useNavigate()
    return (
       
        <div className='item'>
        
        
        <Row className="mt-2">
        <Col lg={12} sm={12} xs={12} md={12}>    
          <Image src={process.env.REACT_APP_IMG_URL + data.image} alt="Фото блюда" />
                <h2>{data.name}</h2>
                <b>{data.price} руб.</b>
               <h3>{data.calories} ккал.</h3>
               <div className="mt-5"></div>
               <div className='add-to-cart' onClick={() => navigate(`/product/${data.id}`)} > Подробнее </div>
               </Col>
        </Row>
        </div>
       
    )
}

export default ProductItem