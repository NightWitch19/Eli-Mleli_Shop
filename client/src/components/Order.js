import { Container, Table } from 'react-bootstrap'

const Order = (props) => {
    return (


        <Container fluid="lg">
        
            <ul>
                <li className='fontorder'>Дата заказа: {props.data.prettyCreatedAt}</li>
                <li className='fontorder'>
                    Статус заказа:
                    {props.data.status === 0 && <span>Новый</span>}
                    {props.data.status === 1 && <span>В работе</span>}
                    {props.data.status === 2 && <span>Завершен</span>}
                </li>
            </ul>
            <ul>
                <li className='fontorder'>ФИО: {props.data.name}</li>
                <li className='fontorder'>Адрес эл.почты: {props.data.email}</li>
                <li className='fontorder'>Номер телефона: {props.data.phone}</li>
                <li className='fontorder'>Адрес доставки: {props.data.address}</li>
                <li className='fontorder'>Комментарий: {props.data.comment}</li>
            </ul>
            <Table bordered className='centertab'style={{color: '#fff'}}>
                <thead>
                    <tr>
                    <th style={{  textAlign: 'center', verticalAlign: 'middle'}}>Название</th>
                    <th style={{  textAlign: 'center', verticalAlign: 'middle'}}>Цена</th>
                    <th style={{  textAlign: 'center', verticalAlign: 'middle'}}>Кол-во</th>
                    <th style={{  textAlign: 'center', verticalAlign: 'middle'}}>Сумма</th>
                    </tr>
                </thead>
                <tbody>
                    {props.data.items.map(item => 
                        <tr key={item.id}>
                            <td>{item.name}</td>
                            <td style={{  textAlign: 'center', verticalAlign: 'middle'}}>{item.price}</td>
                            <td style={{  textAlign: 'center', verticalAlign: 'middle'}}>{item.quantity}</td>
                            <td style={{  textAlign: 'center', verticalAlign: 'middle'}}>{item.price * item.quantity}</td>
                        </tr>
                    )}
                    <tr>
                        <td colSpan={3}>Итого</td>
                        <td>{props.data.amount}</td>
                    </tr>
                </tbody>
            </Table>
            </Container>
            
    )
}

export default Order