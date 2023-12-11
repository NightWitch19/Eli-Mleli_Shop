import {Container, Table } from 'react-bootstrap'
import { Link } from 'react-router-dom'

const Orders = (props) => {

    if (props.items.length === 0) {
        return <p className='carttext'>Список заказов пустой</p>
    }

    return (

       
        <Container fluid="lg">
           
        <Table bordered className='centertab1'style={{ fontSize: 18, color: '#fff'}}>
            <thead>
                <tr>
                    <th style={{  textAlign: 'center', verticalAlign: 'middle'}}>№</th>
                    <th style={{  textAlign: 'center', verticalAlign: 'middle'}}>Дата</th>
                    <th style={{  textAlign: 'center', verticalAlign: 'middle'}}>Покупатель</th>
                    <th style={{  textAlign: 'center', verticalAlign: 'middle'}}>Адрес почты</th>
                    <th style={{  textAlign: 'center', verticalAlign: 'middle'}}>Телефон</th>
                    <th style={{  textAlign: 'center', verticalAlign: 'middle'}}>Статус</th>
                    <th style={{  textAlign: 'center', verticalAlign: 'middle'}}>Сумма</th>
                    <th style={{  textAlign: 'center', verticalAlign: 'middle'}}>Подробнее</th>
                </tr>
            </thead>
            <tbody>
                {props.items.map(item => 
                    <tr key={item.id}>
                        <td style={{  textAlign: 'center', verticalAlign: 'middle'}}>{item.id}</td>
                        <td style={{  textAlign: 'center', verticalAlign: 'middle'}}>{item.prettyCreatedAt}</td>
                        <td style={{  textAlign: 'center', verticalAlign: 'middle'}}>{item.name}</td>
                        <td style={{  textAlign: 'center', verticalAlign: 'middle'}}>{item.email}</td>
                        <td style={{  textAlign: 'center', verticalAlign: 'middle'}}>{item.phone}</td>
                        <td style={{  textAlign: 'center', verticalAlign: 'middle'}}>{item.status}</td>
                        <td style={{  textAlign: 'center', verticalAlign: 'middle'}}>{item.amount}</td>
                        <td>
                            {props.admin ? (
                                <Link style={{ fontSize: 20, color: '#fd7e14'}} to={`/admin/order/${item.id}`}>Подробнее</Link>
                            ) : (
                                <Link style={{ fontSize: 20, color: '#fd7e14'}} to={`/user/order/${item.id}`}>Подробнее</Link>
                            )}
                            
                        </td>
                    </tr>
                )}
            </tbody>
        </Table>
        
        </Container>
        
    )
}

export default Orders