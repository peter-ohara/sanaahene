import { Controller } from "@hotwired/stimulus"

import Sortable from 'sortablejs/modular/sortable.complete.esm.js';


// Connects to data-controller="sortable"
export default class extends Controller {
  static targets = ["list"]

  connect() {
    const sortableSpeed = 100;

    return;


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
          const category = evt.to.getAttribute('data-category')
          const form = card.querySelector('#hidden_category_form')
          const input = form.querySelector('#hidden_category_field')
          input.value = category
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
