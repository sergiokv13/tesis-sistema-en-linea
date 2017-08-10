require 'test_helper'

class MesasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mesa = mesas(:one)
  end

  test "should get index" do
    get mesas_url
    assert_response :success
  end

  test "should get new" do
    get new_mesa_url
    assert_response :success
  end

  test "should create mesa" do
    assert_difference('Mesa.count') do
      post mesas_url, params: { mesa: { direccion_blockchain: @mesa.direccion_blockchain, nombre: @mesa.nombre, numero_maximo_votantes: @mesa.numero_maximo_votantes, recinto_id: @mesa.recinto_id } }
    end

    assert_redirected_to mesa_url(Mesa.last)
  end

  test "should show mesa" do
    get mesa_url(@mesa)
    assert_response :success
  end

  test "should get edit" do
    get edit_mesa_url(@mesa)
    assert_response :success
  end

  test "should update mesa" do
    patch mesa_url(@mesa), params: { mesa: { direccion_blockchain: @mesa.direccion_blockchain, nombre: @mesa.nombre, numero_maximo_votantes: @mesa.numero_maximo_votantes, recinto_id: @mesa.recinto_id } }
    assert_redirected_to mesa_url(@mesa)
  end

  test "should destroy mesa" do
    assert_difference('Mesa.count', -1) do
      delete mesa_url(@mesa)
    end

    assert_redirected_to mesas_url
  end
end
