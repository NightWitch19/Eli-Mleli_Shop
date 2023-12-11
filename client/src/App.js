import { BrowserRouter } from 'react-router-dom'
import AppRouter from './components/AppRouter.js'
import NavBar from './components/NavBar.js'
import { Container, Row, Col, Spinner } from 'react-bootstrap'
import { AppContext } from './components/AppContext.js'
import { check as checkAuth } from './http/userAPI.js'
import { useState, useContext, useEffect } from 'react'
import { observer } from 'mobx-react-lite'
import Loader from './components/Loader.js'
import {ThemeProvider} from 'react-bootstrap';
import { fetchBasket } from './http/basketAPI.js'

import axios from 'axios'
import Footer from './components/Footer.js'

const App = observer(() => {
    const { user, basket } = useContext(AppContext)
    const [loading, setLoading] = useState(true)

    useEffect(() => {
        Promise.all([checkAuth(), fetchBasket()])
            .then(
                axios.spread((userData, basketData) => {
                    if (userData) {
                        user.login(userData)
                    }
                    basket.products = basketData.products
                })
            )
            .finally(
                () => setLoading(false)
            )
    }, [])

    // показываем loader, пока получаем пользователя и корзину
    if (loading) {
        return <Loader />
    }

    return (
        <ThemeProvider
        breakpoints={['xxxl', 'xxl', 'xl', 'lg', 'md', 'sm', 'xs', 'xxs']}
        minBreakpoint="xxs"
      >
        <BrowserRouter>
         <div className="wrapper">
            <NavBar />
            <AppRouter />
            <Container fluid="lg">
            <div className='centernav'>
            <Footer />
            </div>
            </Container>
            </div>
        </BrowserRouter>
        </ThemeProvider>
    )
})

export default App
