import express from 'express'

import product from './product.js'
import category from './category.js'
import user from './user.js'
import basket from './basket.js'
import order from './order.js'

const router = new express.Router()

router.use('/product', product)
router.use('/category', category)
router.use('/user', user)
router.use('/basket', basket)
router.use('/order', order)

export default router