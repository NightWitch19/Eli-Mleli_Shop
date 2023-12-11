import BasketList from '../components/BasketList.js'
import { Container } from 'react-bootstrap'

const Basket = () => {
    return (
        <div className='bgpizza'>
        <Container fluid="lg">
          

            <h1 className='area' style= {{color: '#fd7e14'}} >Корзина</h1>
            <BasketList />
        </Container>
        </div>
    )
}

export default Basket