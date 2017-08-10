require 'test_helper'

class RecintosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recinto = recintos(:one)
  end

  test "should get index" do
    get recintos_url
    assert_response :success
  end

  test "should get new" do
    get new_recinto_url
    assert_response :success
  end

  test "should create recinto" do
    assert_difference('Recinto.count') do
      post recintos_url, params: { recinto: { nombre: @recinto.nombre, numero_maximo_votantes: @recinto.numero_maximo_votantes, sector_id: @recinto.sector_id } }
    end

    assert_redirected_to recinto_url(Recinto.last)
  end

  test "should show recinto" do
    get recinto_url(@recinto)
    assert_response :success
  end

  test "should get edit" do
    get edit_recinto_url(@recinto)
    assert_response :success
  end

  test "should update recinto" do
    patch recinto_url(@recinto), params: { recinto: { nombre: @recinto.nombre, numero_maximo_votantes: @recinto.numero_maximo_votantes, sector_id: @recinto.sector_id } }
    assert_redirected_to recinto_url(@recinto)
  end

  test "should destroy recinto" do
    assert_difference('Recinto.count', -1) do
      delete recinto_url(@recinto)
    end

    assert_redirected_to recintos_url
  end
end
