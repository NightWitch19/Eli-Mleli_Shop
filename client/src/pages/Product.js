import { Container, Row, Col, Button, Image, Spinner, Table } from 'react-bootstrap'
import { useEffect, useState, useContext } from 'react'
import { fetchOneProduct } from '../http/catalogAPI.js'
import { useParams } from 'react-router-dom'
import { append } from '../http/basketAPI.js'
import { AppContext } from '../components/AppContext.js'
import { Link, useNavigate } from 'react-router-dom'
import Footer from '../components/Footer';

const Product = () => {
    const { id } = useParams()
    const { basket } = useContext(AppContext)
    const [product, setProduct] = useState(null)


    useEffect(() => {
        fetchOneProduct(id).then(data => setProduct(data))
    
    }, [id])

    const handleClick = (productId) => {
        append(productId).then(data => {
            basket.products = data.products
        })
    }

    if (!product) {
        return <Spinner animation="border" />
    }

    return (
        <div className='bgcard'>
       
        <Container maxWidth="lg">
        <div className='carditem'>
           <Row>
           <Col lg={12} sm={12} xs={12} md={12}>
                        <Image className='cardimg' width={400} height={400} src={process.env.REACT_APP_IMG_URL + product.image} alt="Фото блюда" />
                </Col>
                </Row>
                <Row>
                <Col lg={12} sm={12} xs={12}>
                <h2 className='itemname'>{product.name}</h2>
                    <div className='white'> Цена: {product.price} руб.</div>
                   
                </Col>
            </Row>
            {!!product.props.length &&
                <Row>
                    <Col lg={12} sm={12} xs={12} md={12}>
                          
                                    {product.props.map(item => 
                                       <div className='white'key={item.id} style={{ padding: 5}}>
                                            <div>{item.name}: {item.value}</div>
                                          
                                      </div>
                                    )}
                                    <Link to="/shop">
                                    <div className='back'> Назад </div>
                                    </Link>
                                     <div className='home' onClick={() => handleClick(product.id)}>В корзину</div>
                               
                    </Col>
                </Row>
}
                </div>
             
        </Container>
        </div>
        );
    };

export default Product