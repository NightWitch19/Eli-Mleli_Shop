import { Container, Navbar, Nav } from 'react-bootstrap'
import { NavLink } from 'react-router-dom'
import { AppContext } from './AppContext.js'
import { useContext } from 'react'
import {Button} from 'react-bootstrap';
import { Link, useNavigate } from 'react-router-dom'
import { observer } from 'mobx-react-lite'
import {ThemeProvider} from 'react-bootstrap';


const NavBar = observer(() => {
    
    const { user, basket } = useContext(AppContext)
    return (
       
        <Navbar className='navlink' bg="black" variant="dark" fixed="top" >
        <Container fluid="lg">
            <Link to="/">
               <img className='logo' src={"./img/logo_light.svg"}  alt="Логотип Ели-Млели" />
               </Link>
                <Nav className="ml-auto">
                <Link to="/">
                          <Button className='btn1'  variant={"outline-light"}  style= {{color: '#fd7e14'}} >
                              Главная
                         </Button>
                     </Link>
                
                    {user.isAuth ? (
                         <Link to="/user">
                          <Button className='btn1'  variant={"outline-light"}  style= {{color: '#fd7e14'}} >
                              Кабинет
                         </Button>
                     </Link>
                    ) : (
                        <>
                         
                     <Link to="/signup">
                          <Button className='btn1'  variant={"outline-light"}  style= {{color: '#fd7e14'}} >
                              Регистрация
                         </Button>
                     </Link>
                        </>
                    )}
                    {user.isAdmin && (
                        <Link to="/admin">
                        <Button className='btn1'  variant={"outline-light"}  style= {{color: '#fd7e14'}} >
                            Админ 
                       </Button>
                   </Link>
                    )}
                    
                       <a href="/basket" ><img className='bgbtn' style={{cursor: 'pointer',marginLeft: 10}} src={"./img/cartorange.png"} alt="Корзина" /></a>

                        {!!basket.count && <span style= {{color: '#fd7e14'}}>({basket.count})</span>}
                    
                </Nav>
            </Container>
        </Navbar>
        
    )
})

export default NavBar