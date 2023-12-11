
import { useContext } from 'react'
import { AppContext } from './AppContext.js'
import { observer } from 'mobx-react-lite'
import { useNavigate, createSearchParams } from 'react-router-dom'
import { Button } from 'react-bootstrap'

const CategoriesBar = observer(() => {
    const { catalog } = useContext(AppContext)
    const navigate = useNavigate()

    const handleClick = (id) => {
        if (id === catalog.category) {
            catalog.category = null
        } else {
            catalog.category = id
        }
       
        const params = {}
        if (catalog.category) params.category = catalog.category
        if (catalog.page > 1) params.page = catalog.page
        navigate({
            pathname: '/shop',
            search: '?' + createSearchParams(params),
        })
    }

    return (
       <div style={{marginTop: '50px'}}>
            {catalog.categories.map(item =>
                <Button className='categories'
                    key={item.id}
                    onClick={() => handleClick(item.id)}
                    active={item.id === catalog.category}
                    style={{cursor: 'pointer', background: 'white'}}>
            
                    {item.name}
                    </Button>
                    
            )}
        </div>
    )
    
})

export default CategoriesBar