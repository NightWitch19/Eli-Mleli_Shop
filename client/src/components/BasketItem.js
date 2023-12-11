import { Button } from 'react-bootstrap'

const BasketItem = (props) => {
    return (
        <tr>
            
            <td>{props.name}</td>
            <td style={{  textAlign: 'center', verticalAlign: 'middle'}}>
                <Button variant="outline-light" size="sm" onClick={() => props.decrement(props.id)}>-</Button>
                {' '}<strong>{props.quantity}</strong>{' '}
                <Button variant="outline-light"  size="sm" onClick={() => props.increment(props.id)}>+</Button>
            </td>
            <td style={{  textAlign: 'center', verticalAlign: 'middle'}}>{props.price}</td>
            <td style={{  textAlign: 'center', verticalAlign: 'middle'}}>{props.price * props.quantity}</td>
            <td>
            <Button variant="danger" onClick={() => props.remove(props.id)} style={{fontSize: 20}}>
                    Удалить
                </Button>
            </td>
        </tr>
    );
}

export default BasketItem