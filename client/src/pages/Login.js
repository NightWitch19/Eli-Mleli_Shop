import { AppContext } from '../components/AppContext.js'
import { useContext, useEffect } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { Container, Card, Row, Col, Form, Button } from 'react-bootstrap'
import { login } from '../http/userAPI.js'
import { observer } from 'mobx-react-lite'

const Login = observer(() => {
    const { user } = useContext(AppContext)
    const navigate = useNavigate()

    
    useEffect(() => {
        if (user.isAdmin) navigate('/admin', {replace: true})
        if (user.isAuth) navigate('/user', {replace: true})
    }, [])

    const handleSubmit = async (event) => {
        event.preventDefault()
        const email = event.target.email.value.trim()
        const password = event.target.password.value.trim()
        const data = await login(email, password)
        if (data) {
            user.login(data)
            if (user.isAdmin) navigate('/admin')
            if (user.isAuth) navigate('/user')
        }
    }

    return (
        <div className='sales'>
        <Container fluid="lg">
            
           <Row className="mt-5">
            <Col md={12}>
            <Card className='cent'>
                <h2 className='cent1'>Авторизация</h2>
                <Form className="d-flex flex-column" onSubmit={handleSubmit}>
                <Form.Control style= {{color: '#fd7e14'}} 
                 name="email"
                 className="input"
                 placeholder="Введите email..."
               
                    />
                     <Form.Control style= {{color: '#fd7e14'}} 
                   name="password"
                   className="input"
                   placeholder="Введите пароль..."
                   type='password'
                    />

                    <Row className="d-flex justify-content-between mt-3 pl-3 pr-3">
                    <Button type="submit" variant={"outline-dark"} className='authbutton'
                style= {{color: '#fd7e14'}}>
                            Войти
                        </Button>
                        <p className='textform'>
                            Нет аккаунта?
                            <Link to="/signup">Зарегистрирутесь!</Link>
                        </p>
                        </Row>
                </Form>
             </Card>
            </Col>
            </Row>
            </Container>
            </div>
        
    )
})

export default Login
