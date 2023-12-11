import React, { useContext, useEffect, useState } from 'react';
import { Context } from '..';
import { observer } from 'mobx-react-lite';
import Footer from '../components/Footer';
import {Button} from 'react-bootstrap';
import { Link,useNavigate} from 'react-router-dom'
// import {LOGIN_ROUTE, SHOP_ROUTE} from '../utils/consts';
import { Row, Col, Container } from "react-bootstrap";

const Home = observer(() => {
 
    const navigate = useNavigate()
    return (
        <div>
        <div className='bg'> 
             <Container maxWidth="lg">
            <Row className="mt-2">
            <Col lg={12} sm={12} xs={12} md={12}>
          
      
       
          
          <div className='logohome'> Ресторан быстрого обслуживания </div>
          <div className='textone'> Место, где готовят с душой </div>
          <Link to="/shop">
          <Button className='menubtn1'  variant={"outline-light"} 
             style= {{color: '#fd7e14'}} 
              > 
        
              Меню
              
              </Button>
              </Link>

             

           
           </Col> 
           </Row>
        
           <div className='cont'>
        <Row className="mt-2">
        <Col lg={12} sm={12} xs={12} md={12}>
        
        
        </Col>
        </Row>
        </div>
        </Container>
       
           </div>
      
        </div>
        
    );
   
});



export default Home;