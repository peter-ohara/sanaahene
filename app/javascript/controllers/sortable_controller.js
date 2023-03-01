import { Controller } from "@hotwired/stimulus"

import Sortable from 'sortablejs/modular/sortable.complete.esm.js';


// Connects to data-controller="sortable"
export default class extends Controller {
  static targets = ["list"]

  connect() {
    const sortableSpeed = 100;


    this.listTargets.forEach(function (listTarget, index) {
      const defaultSortable = Sortable.create(listTarget, {
        group: {
          name: `list${index}`,
          pull: true,
          put: true,
        },
        animation: sortableSpeed,

        onMove: function(evt) {
          const card = evt.dragged
          const pnlType= evt.to.getAttribute('data-pnl-type')
          const form = card.querySelector('form.edit_momo_import_line') || card.querySelector('form.edit_ecobank_import_line')
          const input = form.querySelector('input[name="momo_import_line[pnl_type]"]') || form.querySelector('input[name="ecobank_import_line[pnl_type]"]')
          input.value = pnlType

          form.requestSubmit()

        },
        onSort: function(evt) {
          // evt.from.classList.remove("adding");
        },
        onEnd: function(evt) {
          // group2.classList.remove("adding");
        },
        filter: ".remove",
        onFilter: function(evt) {
          const item = evt.item,
              ctrl = evt.target;
          if (Sortable.utils.is(ctrl, ".remove")) {
            // Click on remove button
            $(item).slideUp('400', function() {
              $(item).remove();
            });
          }
        }
      });
    })

  }
}
