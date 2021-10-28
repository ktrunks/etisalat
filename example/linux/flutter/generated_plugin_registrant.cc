//
//  Generated file. Do not edit.
//

#include "generated_plugin_registrant.h"

#include <etisalat/etisalat_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) etisalat_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "EtisalatPlugin");
  etisalat_plugin_register_with_registrar(etisalat_registrar);
}
