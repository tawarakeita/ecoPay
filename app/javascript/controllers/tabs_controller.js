import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tabs"
export default class extends Controller {
  static targets = ["tab", "panel", "select"]
  static classes = ["activeTab", "inactiveTab"]
  static values = {
    index: Number,
    updateAnchor: Boolean
  }

  connect() {
    // Ensure tabs have stable indexes (useful if inner elements are clicked)
    this.tabTargets.forEach((tab, i) => {
      if (tab.dataset.index === undefined) tab.dataset.index = String(i)
    })

    // If URL anchor is present, try to set initial index from it
    if (this.anchor) {
      const anchorIndex = this.tabTargets.findIndex((tab) => tab.id === this.anchor)
      if (anchorIndex !== -1) this.indexValue = anchorIndex
    }

    // Ensure indexValue has a sensible default
    if (this.indexValue === undefined || Number.isNaN(this.indexValue)) this.indexValue = 0

    this.showTab()
  }

  change(event) {
    event.preventDefault()

    // Determine the tab element clicked (handle inner elements)
    const tabElement = event.target.closest('[data-tabs-target="tab"]') || event.currentTarget
    if (!tabElement) return

    if (tabElement.tagName === "SELECT") {
      this.indexValue = tabElement.selectedIndex
    } else if (tabElement.dataset.index) {
      this.indexValue = parseInt(tabElement.dataset.index, 10)
    } else if (tabElement.dataset.id) {
      this.indexValue = this.tabTargets.findIndex((tab) => tab.id == tabElement.dataset.id)
    } else {
      this.indexValue = this.tabTargets.indexOf(tabElement)
    }

    window.dispatchEvent(new CustomEvent('tsc:tab-change'))
  }

  nextTab() {
    this.indexValue = Math.min(this.indexValue + 1, this.tabsCount - 1)
  }

  previousTab() {
    this.indexValue = Math.max(this.indexValue - 1, 0)
  }

  firstTab() {
    this.indexValue = 0
  }

  lastTab() {
    this.indexValue = this.tabsCount - 1
  }

  indexValueChanged() {
    this.showTab()
    if (this.updateAnchorValue) {
      const id = this.tabTargets[this.indexValue]?.id
      if (id) location.hash = id
    }
  }

  showTab() {
    this.panelTargets.forEach((panel, index) => {
      const tab = this.tabTargets[index]

      if (index === this.indexValue) {
        panel.classList.remove('hidden')
        if (this.hasInactiveTabClass) tab?.classList?.remove(...this.inactiveTabClasses)
        if (this.hasActiveTabClass) tab?.classList?.add(...this.activeTabClasses)
        // Add green underline to active tab (ensure visual indicator)
        if (tab) {
          tab.classList.add('border-b-2', 'border-green-800', '-mb-px')
          tab.classList.remove('border-transparent')
        }
      } else {
        panel.classList.add('hidden')
        if (this.hasActiveTabClass) tab?.classList?.remove(...this.activeTabClasses)
        if (this.hasInactiveTabClass) tab?.classList?.add(...this.inactiveTabClasses)
        // Remove underline from inactive tabs
        if (tab) {
          tab.classList.remove('border-b-2', 'border-green-800', '-mb-px')
        }
      }
    })

    if (this.hasSelectTarget) {
      this.selectTarget.selectedIndex = this.indexValue
    }
  }

  get tabsCount() {
    return this.tabTargets.length
  }

  get anchor() {
    return (document.URL.split('#').length > 1) ? document.URL.split('#')[1] : null;
  }
}
