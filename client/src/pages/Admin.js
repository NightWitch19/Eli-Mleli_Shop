import { Container, Row, Col, Button } from 'react-bootstrap'
import { useContext } from 'react'
import { AppContext } from '../components/AppContext.js'
import { Link, useNavigate } from 'react-router-dom'
import { logout } from '../http/userAPI.js'
import Footer from '../components/Footer';

const Admin = () => {
    const { user } = useContext(AppContext)
    const navigate = useNavigate()

    const handleLogout = (event) => {
        logout()
        user.logout()
        navigate('/login', {replace: true})
    }

    return (
        <div>
        <div className='sales'>
        <Container className="d-flex flex-column">


            <h1 className='area' style= {{color: '#fd7e14'}} >Админ панель</h1>
            <div className="mt-4"> </div>
           
            <Button  
           variant = {"outline-light"} 
           className='menubtn5'><Link className='link' to="/admin/orders">Заказы в ресторане</Link></Button>
          
            <Button  
           variant = {"outline-light"} 
           className='menubtn5'><Link className='link' to="/admin/category">Категории блюд</Link></Button>
            <Button  
           variant = {"outline-light"} 
           className='menubtn5'><Link className='link' to="/admin/products">Блюда</Link></Button>
          
          <Button  
           variant = {"outline-light"} 
           className='menubtn5'  
           style={{color: '#fff'}} onClick={handleLogout}>Выйти</Button>


           </Container>
           
        </div>
        
        </div>
    )
}

export default Admin