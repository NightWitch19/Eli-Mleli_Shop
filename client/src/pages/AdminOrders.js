import { useState, useEffect } from 'react'
import { adminGetAll as getAllOrders } from '../http/orderAPI.js'
import { Button, Container, Spinner } from 'react-bootstrap'
import Orders from '../components/Orders.js'
import CreateOrder from '../components/CreateOrder.js'

const AdminOrders = () => {
    const [orders, setOrders] = useState(null)
    const [fetching, setFetching] = useState(true)
    const [show, setShow] = useState(false)

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
        <div className='bgpizza1'>
         <Container fluid="lg">
            <h1 className='area'>Все заказы</h1>
            <Button  
           variant = {"outline-light"} 
           className='menubtn5' 
           style={{width: 400, height:  100, fontSize: 30, color: '#fff'}} onClick={() => setShow(true)}>Создать заказ</Button>
            <CreateOrder show={show} setShow={setShow} />
            <Orders items={orders} admin={true} />
        </Container>
        </div>
    )
}

export default AdminOrders