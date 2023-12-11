import { Container,Row, Col,Button } from 'react-bootstrap'
import { useContext } from 'react'
import { AppContext } from '../components/AppContext.js'
import { Link, useNavigate } from 'react-router-dom'
import { logout } from '../http/userAPI.js'
import Footer from '../components/Footer';

const User = () => {
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
           
           
            <h1 className='area' style= {{color: '#fd7e14'}} >Личный кабинет</h1>
            <div className="mt-4"> </div>
            <Button  
           variant = {"outline-light"} 
           className='menubtn5'> <Link className='link' to="/user/orders"> 🛒 История заказов</Link></Button>
           
            <Button  
           variant = {"outline-light"} 
           className='menubtn6' 
           style={{color: '#fff'}} onClick={handleLogout}>Выйти</Button>
           <h1 className='textuser'>-50% в День Рождения на всю кулинарию</h1>
           <h1 className='textuser'>-10% по карте Гостя</h1>
         
         
           </Container>
           
        </div>
        
        </div>
    )

}

export default User