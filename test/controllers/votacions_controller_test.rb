require 'test_helper'

class VotacionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @votacion = votacions(:one)
  end

  test "should get index" do
    get votacions_url
    assert_response :success
  end

  test "should get new" do
    get new_votacion_url
    assert_response :success
  end

  test "should create votacion" do
    assert_difference('Votacion.count') do
      post votacions_url, params: { votacion: { finalizacion: @votacion.finalizacion, inicio: @votacion.inicio, numero_maximo_autenticaciones: @votacion.numero_maximo_autenticaciones, numero_maximo_votantes: @votacion.numero_maximo_votantes, razon: @votacion.razon, tiempo_maximo_votos: @votacion.tiempo_maximo_votos } }
    end

    assert_redirected_to votacion_url(Votacion.last)
  end

  test "should show votacion" do
    get votacion_url(@votacion)
    assert_response :success
  end

  test "should get edit" do
    get edit_votacion_url(@votacion)
    assert_response :success
  end

  test "should update votacion" do
    patch votacion_url(@votacion), params: { votacion: { finalizacion: @votacion.finalizacion, inicio: @votacion.inicio, numero_maximo_autenticaciones: @votacion.numero_maximo_autenticaciones, numero_maximo_votantes: @votacion.numero_maximo_votantes, razon: @votacion.razon, tiempo_maximo_votos: @votacion.tiempo_maximo_votos } }
    assert_redirected_to votacion_url(@votacion)
  end

  test "should destroy votacion" do
    assert_difference('Votacion.count', -1) do
      delete votacion_url(@votacion)
    end

    assert_redirected_to votacions_url
  end
end
