import { YMaps } from '@pbe/react-yandex-maps';
import { Map } from '@pbe/react-yandex-maps';
export default function Footer() {
   
    return (
        
           
<footer class="footer">
          
<table className='table'>

  <tr>
  <td> 
  <h1>Контакты</h1>
  </td>
  <td> 
  <h1>Доставка</h1>
  </td>
  <td> 
  <h1>Карта</h1>
  </td>
  </tr>
  <tr>
    <td  style= {{width: '500px'}}>
    <a href="tel:+78632850810">Телефон: +7 863 285-08-10</a>
    <a href="mailto:zakaz@eli-mleli.ru">Почта: zakaz@eli-mleli.ru </a>
    <div class="social vk">
    <a  href="https://vk.com/elimlelirostov?ysclid=lh4y3tztzb362836338" target="_blank"><i class="fa fa-vk fa-2x"></i></a>    
</div>
    </td>
    
 
    <td  style= {{width: '600px'}}>
    <b>Сервис быстрой доставки Яндекс еда! </b>
    <b> - 20% скидка на первый заказ  </b>
    <b>Доставка от 15 минут</b>
    <b>Самовывоз</b>
  
    </td>
  
    <td  style= {{width: '100px'}}>
    <YMaps>
    
      <Map defaultState={{ center: [47.227022, 39.695236], zoom: 20 }}  />
   
  </YMaps>
    </td>
  </tr>
  <tr>
   
    
  </tr>
  
</table>
  

 <footer className='page-footer'>
        <div style={{color: 'white'}}>
        © {new Date().getFullYear()} Ели-Млели | Все права защищены
       
    </div>
    <div>
    
    </div>
   
    </footer>
    </footer>
    
    );
}