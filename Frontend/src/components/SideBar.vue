<template>
    <v-navigation-drawer
      v-model="drawer"
      app
      dark
      color="grey darken-3"
      style="width: 60px"
    >
     
      <v-list>
        <v-list-item-group
        v-model="selectedItem">
        <v-list-item
          v-for="(item, i) in items"
          :key="i"
          active-class="border"
        >
          <v-list-item-icon>
            <v-icon v-text="item.icon"></v-icon>
          </v-list-item-icon>
          <v-list-item-content>
            <v-list-item-title v-text="item.text"></v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list-item-group>
      </v-list>
    </v-navigation-drawer>

</template>

<script>
  export default {
    data: () => ({ 
        drawer: null,
        selectedItem: 1,
      items: [
        /* { text: 'DASHBOARD', icon: 'mdi-view-dashboard' },
        { text: 'PROJECTS', icon: 'mdi-briefcase-check' },
        { text: 'MY TASK', icon: 'mdi-menu' },
        { text: 'CALENDAR', icon: 'mdi-calendar' },
        { text: 'TIME MANAGE', icon: 'mdi-clock' },
        { text: 'REPORTS', icon: 'mdi-chart-pie' },
        { text: 'SETTINGS', icon: 'mdi-cog-outline' }, */
        { icon: 'mdi-view-dashboard' },
        { icon: 'mdi-briefcase-check' },
        { icon: 'mdi-menu' },
        { icon: 'mdi-calendar' },
        { icon: 'mdi-clock' },
        { icon: 'mdi-chart-pie' },
        { icon: 'mdi-cog-outline' },
      ],
        }),
  }
</script>
<style scoped>
.border {
  border-right: 5px solid;
}
</style>