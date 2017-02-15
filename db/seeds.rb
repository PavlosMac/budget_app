require('pry-byebug')
require_relative('../models/category')
require_relative('../models/merchant')
require_relative('../models/transaction')
require_relative('../models/budget')

Transaction.delete_all
Merchant.delete_all
Category.delete_all
Budget.delete_all




@category1 = Category.new({ 'description' =>'food'} )
@category1.save
@category2 = Category.new( {'description' => 'electricity'} )
@category2.save
@category3 = Category.new( {'description' => 'wood'} )
@category3.save
@category4 = Category.new( {'description' => 'clothes'} )
@category4.save
@category5 = Category.new( {'description' => 'beer'} )
@category5.save
@category6 = Category.new( {'description' => 'rent'} )
@category6.save

@budget1 = Budget.new( {'value' => 100, 'category_id' => @category2.id } )
@budget1.save
@budget2 = Budget.new( {'value' => 22, 'category_id' => @category5.id } )
@budget2.save
@budget3 = Budget.new( {'value' => 700, 'category_id' => @category6.id} )
@budget3.save
@budget4 = Budget.new( {'value' => 150, 'category_id' => @category4.id} )
@budget4.save
@budget6 = Budget.new( {'value' => 120, 'category_id' => @category3.id} )
@budget6.save
@budget7 = Budget.new( {'value' => 178, 'category_id' => @category1.id} )
@budget7.save





@merchant1 = Merchant.new( {'name' => 'scottish power'} )
@merchant1.save
@merchant2 = Merchant.new( {'name' => 'tesco'} )
@merchant2.save
@merchant3 = Merchant.new( {'name' => 'tk max'} )
@merchant3.save
@merchant4 = Merchant.new( {'name' => 'forestry commision'} )
@merchant4.save
@merchant5 = Merchant.new( {'name' => 'white horse bar'} )
@merchant5.save
@merchant6 = Merchant.new( {'name' => 'sainsburies'} )
@merchant6.save




@transaction1 = Transaction.new( { 'merchant_id' => @merchant1.id, 'category_id' => @category1.id, 'currency' => 29.00 } )
@transaction1.save
@transaction2 = Transaction.new( { 'merchant_id' => @merchant2.id, 'category_id' => @category3.id, 'currency' => 49.00  } )
@transaction2.save


binding.pry
nil
