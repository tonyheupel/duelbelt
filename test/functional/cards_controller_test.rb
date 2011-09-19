require 'test_helper'

class CardsControllerTest < ActionController::TestCase
  
  setup do
    @card = Card.create do |c|
      c.number      = 'one'
      c.name        = 'Card One'
      c.description = 'Description One'
      c.image_url   = 'Image url one'
      c.quantity    = 1
      c.tokens      = false
      c.counters    = true
      c.coins       = false
      c.dice        = true
      c.slug        = 'one'
    end
  end
  
  teardown do
    @card.delete
  end
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create card" do
    assert_difference('Card.count') do
      # Tweak card attributes so we don't have an issue with uniqueness
      card = @card.attributes
      card["number"] = 'Two'
      card["_id"] = 'two'
      card["slug"] = 'two'
      
      post :create, card: @card.attributes
    end
    
    assert_redirected_to card_path(assigns(:card))
  end

  test "should show card" do
    get :show, id: @card.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @card.to_param
    assert_response :success
  end

  test "should update card" do
    put :update, id: @card.to_param, card: @card.attributes
    assert_redirected_to card_path(assigns(:card))
  end

  test "should destroy card" do
    assert_difference('Card.count', -1) do
      delete :destroy, id: @card.to_param
    end

    assert_redirected_to cards_path
  end
end
# ~> -:33: syntax error, unexpected ':', expecting kEND
# ~>            post :create, card: @card.attributes
# ~>                               ^
# ~> -:40: syntax error, unexpected ':', expecting kEND
# ~>     get :show, id: @card.to_param
# ~>                   ^
# ~> -:45: syntax error, unexpected ':', expecting kEND
# ~>     get :edit, id: @card.to_param
# ~>                   ^
# ~> -:50: syntax error, unexpected ':', expecting kEND
# ~>     put :update, id: @card.to_param, card: @card.attributes
# ~>                     ^
# ~> -:50: syntax error, unexpected ':', expecting '='
# ~>     put :update, id: @card.to_param, card: @card.attributes
# ~>                                           ^
# ~> -:56: syntax error, unexpected ':', expecting kEND
# ~>       delete :destroy, id: @card.to_param
# ~>                           ^
