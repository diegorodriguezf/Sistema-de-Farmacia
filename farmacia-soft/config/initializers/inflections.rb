# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format. Inflections
# are locale specific, and you may define rules for as many different
# locales as you wish. All of these examples are active by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
# end

# These inflection rules are supported but not enabled by default:
 ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.acronym 'RESTful'
   inflect.irregular 'user', 'users'
   inflect.irregular 'cliente', 'clientes'
   inflect.irregular 'empleado', 'empleados'
   inflect.irregular 'timbrado', 'timbrados'
   inflect.irregular 'configuracion', 'configuraciones'
   inflect.irregular 'tipo_uso', 'tipo_usos'
   inflect.irregular 'presentacion_medicamento', 'presentacion_medicamentos'
   inflect.irregular 'medicamento', 'medicamentos'
   inflect.irregular 'tipo_uso_medicamento', 'tipo_usos_medicamentos'
   inflect.irregular 'factura_venta','factura_ventas'
   inflect.irregular 'detalle_factura_venta','detalle_factura_ventas'
   inflect.irregular 'detalle_factura_venta_tmp','detalle_factura_ventas_tmp'
   inflect.irregular 'stock','stocks'
   inflect.irregular 'movimiento_stock','movimiento_stocks'
   inflect.irregular 'detalle_movimiento_stock','detalle_movimiento_stocks'
end
