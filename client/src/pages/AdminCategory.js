import { useState, useEffect } from 'react'
import { fetchCategories, deleteCategory } from '../http/catalogAPI.js'
import { Button, Container, Spinner, Table } from 'react-bootstrap'
import EditCategories from '../components/EditCategories.js'

const AdminCategory = () => {
    const [categories, setCategories] = useState(null) // список загруженных брендов
    const [fetching, setFetching] = useState(true) // загрузка списка брендов с сервера
    const [show, setShow] = useState(false) // модальное окно создания-редактирования
    // для обновления списка после добавления, редактирования, удаления — изменяем состояние
    const [change, setChange] = useState(false)
    
    const [categoryId, setCategoryId] = useState(0)

    const handleCreateClick = () => {
        setCategoryId(0)
        setShow(true)
    }

    const handleUpdateClick = (id) => {
        setCategoryId(id)
        setShow(true)
    }

    const handleDeleteClick = (id) => {
        deleteCategory(id)
            .then(
                data => {
                    setChange(!change)
                    alert(`Категория «${data.name}» удалена`)
                }
            )
            .catch(
                error => alert(error.response.data.message)
            )
    }

    useEffect(() => {
        fetchCategories()
            .then(
                data => setCategories(data)
            )
            .finally(
                () => setFetching(false)
            )
    }, [change])

    if (fetching) {
        return <Spinner animation="border" />
    }

    return (
        <Container>
            <h1 className='area'>Категории</h1>
            <Button  
           variant = {"outline-light"} 
           className='menubtn5' 
           style={{width: 400, height:  100, fontSize: 30, color: '#fff'}} onClick={() => handleCreateClick()}>Создать категорию</Button>
            <EditCategories id={categoryId} show={show} setShow={setShow} setChange={setChange} />
            {categories.length > 0 ? (
                <div className='center'>
                <Table bordered  className="mt-3" style={{width: 380, height:  380, fontSize: 20, color: '#fff'}}>
                
                <thead>
                    <tr>
                        <th>Название</th>
                        <th>Редактировать</th>
                        <th>Удалить</th>
                    </tr>
                </thead>
                <tbody>
                    {categories.map(item => 
                        <tr key={item.id}>
                            <td>{item.name}</td>
                            <td>
                                <Button variant="success" size="sm" onClick={() => handleUpdateClick(item.id)}>
                                    Редактировать
                                </Button>
                            </td>
                            <td>
                                <Button variant="danger" size="sm" onClick={() => handleDeleteClick(item.id)}>
                                    Удалить
                                </Button>
                            </td>
                        </tr>
                    )}
                </tbody>
                </Table>
                </div>
            ) : (
                <p className='area'>Список категорий пустой</p>
            )}
        </Container>
    )
}

export default AdminCategory