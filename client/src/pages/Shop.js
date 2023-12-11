import { Container, Row, Col, Spinner } from 'react-bootstrap'
import CategoriesBar from '../components/CategoriesBar.js'
import ProductList from '../components/ProductList.js'
import { useContext, useEffect, useState } from 'react'
import { AppContext } from '../components/AppContext.js'
import { fetchCategories, fetchAllProducts } from '../http/catalogAPI.js'
import { observer } from 'mobx-react-lite'
import { useLocation, useSearchParams } from 'react-router-dom'
import Carouselimg from '../components/Carouselimg.js'
import Footer from '../components/Footer';

const getSearchParams = (searchParams) => {
    let category = searchParams.get('category')
    if (category && /[1-9][0-9]*/.test(category)) {
        category = parseInt(category)
    }
   
    let page = searchParams.get('page')
    if (page && /[1-9][0-9]*/.test(page)) {
        page = parseInt(page)
    }
    return {category, page}
}

const Shop = observer(() => {
    const { catalog } = useContext(AppContext)

    const [categoriesFetching, setCategoriesFetching] = useState(true)
    const [productsFetching, setProductsFetching] = useState(true)

    const location = useLocation()
    const [searchParams] = useSearchParams()

    useEffect(() => {
        fetchCategories()
            .then(data => catalog.categories = data)
            .finally(() => setCategoriesFetching(false))


        const {category, page} = getSearchParams(searchParams)
        catalog.category = category
        catalog.page = page ?? 1

        fetchAllProducts(catalog.category, catalog.page, catalog.limit)
            .then(data => {
                catalog.products = data.rows
                catalog.count = data.count
            })
            .finally(() => setProductsFetching(false))
       
    }, [])

    
    useEffect(() => {
        const {category, page} = getSearchParams(searchParams)

        if (category || page) {
            if (category !== catalog.category) {
                catalog.category = category
            }

            if (page !== catalog.page) {
                catalog.page = page ?? 1
            }
        } else  {
            catalog.category = null
            catalog.page = 1
        }
        
    }, [location.search])

   
    useEffect(() => {
        setProductsFetching(true)
        fetchAllProducts(catalog.category, catalog.page, catalog.limit)
            .then(data => {
                catalog.products = data.rows
                catalog.count = data.count
            })
            .finally(() => setProductsFetching(false))
        
    }, [catalog.category, catalog.page])

    return (
       
     
            <Container fluid="lg">
            <Row className="mt-2">
             <Col md={12}>
              <Carouselimg />
              </Col>
              </Row>
            <Row className="mt-2">
            <Col lg={12} sm={12} xs={12} md={12}>
                    {categoriesFetching ? (
                        <Spinner animation="border" />
                    ) : (
                        <div className='categfloat'>
                          <CategoriesBar />
                        </div>
                    )}
                </Col>
                </Row>
                <Row className="mt-2">
                <Col lg={12} sm={12} xs={12} md={12}>
                    {categoriesFetching ? (
                        <Spinner animation="border" />
                    ) : (
                        <div className='centercard'>
                          <ProductList />
                          </div>
                         
                    )}
                </Col>
               
            </Row>
         
        </Container>
        
    )
})

export default Shop
