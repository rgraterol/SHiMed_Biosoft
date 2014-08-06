require 'test_helper'

class PersonasControllerTest < ActionController::TestCase
  setup do
    @persona = personas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:personas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create persona" do
    assert_difference('Persona.count') do
      post :create, persona: { apellido: @persona.apellido, cedula: @persona.cedula, direccion: @persona.direccion, fecha_nacimiento: @persona.fecha_nacimiento, nombre: @persona.nombre, sexo: @persona.sexo, telefono_casa: @persona.telefono_casa, telefono_celular: @persona.telefono_celular, telefono_oficina: @persona.telefono_oficina }
    end

    assert_redirected_to persona_path(assigns(:persona))
  end

  test "should show persona" do
    get :show, id: @persona
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @persona
    assert_response :success
  end

  test "should update persona" do
    patch :update, id: @persona, persona: { apellido: @persona.apellido, cedula: @persona.cedula, direccion: @persona.direccion, fecha_nacimiento: @persona.fecha_nacimiento, nombre: @persona.nombre, sexo: @persona.sexo, telefono_casa: @persona.telefono_casa, telefono_celular: @persona.telefono_celular, telefono_oficina: @persona.telefono_oficina }
    assert_redirected_to persona_path(assigns(:persona))
  end

  test "should destroy persona" do
    assert_difference('Persona.count', -1) do
      delete :destroy, id: @persona
    end

    assert_redirected_to personas_path
  end
end
