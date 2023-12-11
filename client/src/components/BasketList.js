import { useContext, useState } from 'react'
import { AppContext } from './AppContext.js'
import { increment, decrement, remove } from '../http/basketAPI.js'
import { Table, Spinner, Button } from 'react-bootstrap'
import { useNavigate } from 'react-router-dom'
import BasketItem from './BasketItem.js'
import { observer } from 'mobx-react-lite'
import {Container} from 'react-bootstrap'
const BasketList = observer(() => {
    const { basket } = useContext(AppContext)
    const [fetching, setFetching] = useState(false)

    const navigate = useNavigate()

    const handleIncrement = (id) => {
        setFetching(true)
        increment(id)
            .then(
                data => basket.products = data.products
            )
            .finally(
                () => setFetching(false)
            )
    }

    const handleDecrement = (id) => {
        setFetching(true)
        decrement(id)
            .then(
                data => basket.products = data.products
            )
            .finally(
                () => setFetching(false)
            )
    }

    const handleRemove = (id) => {
        setFetching(true)
        remove(id)
            .then(
                data => basket.products = data.products
            )
            .finally(
                () => setFetching(false)
            )
    }

    if (fetching) {
        return <Spinner animation="border" />
    }

    return (

        <Container fluid="lg">
          
            {basket.count ? (
                <>
                  
                <Table bordered className='centertab'style={{color: '#fff'}}>
                        <thead>
                            <tr>
                                
                                <th>Наименование</th>
                                <th style={{  textAlign: 'center', verticalAlign: 'middle'}}>Количество</th>
                                <th style={{  textAlign: 'center', verticalAlign: 'middle'}}>Цена</th>
                                <th style={{  textAlign: 'center', verticalAlign: 'middle'}}>Сумма</th>
                                <th style={{  textAlign: 'center', verticalAlign: 'middle'}}>Удалить</th>
                            </tr>
                        </thead>
                        <tbody>
                            {basket.products.map(item => 
                                <BasketItem
                                    key={item.id}
                                    increment={handleIncrement}
                                    decrement={handleDecrement}
                                    remove={handleRemove}
                                    {...item}
                                />
                            )}
                            <tr>
                                <th colSpan="3">Итого:</th>
                                <th style={{  textAlign: 'center', verticalAlign: 'middle'}}>{basket.sum}</th>
                                <th>руб.</th>
                            </tr>
                        </tbody>
                    </Table>
                    <Button className='order' style={{cursor: 'pointer', background: '#fd7e14'}} onClick={() => navigate('/checkout')}>Оформить заказ</Button>
                </>
            ) : (
                <p className='carttext'>Ваша корзина пуста</p>
            )}

</Container>


        
    )
})

export default BasketList