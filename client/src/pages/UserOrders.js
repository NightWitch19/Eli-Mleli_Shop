import { useState, useEffect } from 'react'
import { userGetAll as getAllOrders } from '../http/orderAPI.js'
import { Container, Spinner } from 'react-bootstrap'
import Orders from '../components/Orders.js'

const UserOrders = () => {
    const [orders, setOrders] = useState(null)
    const [fetching, setFetching] = useState(true)

    useEffect(() => {
        getAllOrders()
            .then(
                data => setOrders(data)
            )
            .finally(
                () => setFetching(false)
            )
    }, [])

    if (fetching) {
        return <Spinner animation="border" />
    }

    return (

        <div className='bgpizza'>
        <Container fluid="lg">
        <h1 className='area' style= {{color: '#fd7e14'}} >Ваши заказы</h1>
            <Orders items={orders} admin={false} />
        </Container>
        </div>
    )
}

export default UserOrders