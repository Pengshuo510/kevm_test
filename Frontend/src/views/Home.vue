<template>
  <div class="home" >
    <div
        class=" ma-5 secondary text-no-wrap rounded-lg float-left"
      >
      <v-app-bar
      color="grey darken-3"
      dark
      class="rounded-lg "
      width="250"
    >
       <!-- <v-text-field
            label="Select a program"
            prepend-icon="mdi-magnify"
            color="white"
          ></v-text-field> -->
       <v-select
            :items="items"
            label="Program"
          ></v-select>
    </v-app-bar>   
    </div>

      <div
        class=" ma-5 secondary text-no-wrap rounded-lg float-left"
      >
      <v-app-bar
      color="grey darken-3"
      dark
      class="rounded-lg"
      width="250"
    >
       <v-col>
        <v-menu
          ref="menu"
          v-model="menu"
          :close-on-content-click="false"
          :return-value.sync="date"
          transition="scale-transition"
          offset-y
          min-width="auto"
        >
          <template v-slot:activator="{ on, attrs }">
            <v-text-field
              v-model="date"
              label="Date"
              prepend-icon="mdi-calendar"
              readonly
              v-bind="attrs"
              v-on="on"
            ></v-text-field>
          </template>
          <v-date-picker
            v-model="date"
            range
          >
            <v-spacer></v-spacer>
            <v-btn
              text
              color="primary"
              @click="menu = false"
            >
              Cancel
            </v-btn>
            <v-btn
              text
              color="primary"
              @click="$refs.menu.save(date)"
            >
              OK
            </v-btn>
          </v-date-picker>
        </v-menu>
      </v-col>
    </v-app-bar>   
    </div>

      <div
        class=" ma-5 secondary text-no-wrap rounded-lg float-left"
      >
      <v-app-bar
      color="grey darken-3"
      dark
      class="rounded-lg"
      >
      <v-btn
      @click="start()"
      plain>
      Start
      </v-btn>
      </v-app-bar>
      </div>

      <div
        class=" ma-5 secondary text-no-wrap rounded-lg float-left"
      >
      <v-app-bar
      color="grey darken-3"
      dark
      class="rounded-lg "
      width="130"
    >
    <v-list-item>
      <v-list-item-content>
        <v-list-item-title>Vue v2.6</v-list-item-title>
        <v-list-item-title>Vuetify v2.2</v-list-item-title>
        <v-list-item-title>Plotly v2.3</v-list-item-title>
      </v-list-item-content>
    </v-list-item>
    </v-app-bar>   
    </div>

<!--Chart-->
      <div class="float-left">
        <div id="barChart1"></div>
        <div id="barChart2"></div>
        <div id="barChart3"></div>
        <div id="barChart4"></div>
        <div id="barChart5"></div>
        <div id="dataTable" style="width: 900px">
          <v-card>
            <v-card-title>
              Data
            </v-card-title>
            <v-data-table dense
              :headers="headers"
              :items="food"
              :items-per-page="5"
            ></v-data-table>
          </v-card>
        </div>
        <div id="plotlyTable"></div>
      </div>
  </div>
</template>

<script>
import Plotly from 'plotly.js-dist';

export default {
  data: () => ({
      items: ['Program 1', 'Program 2', 'Program 3', 'Program 4'],
      trace1:{},
      trace2:{},
      trace3:{},
      trace4:{},
      trace5:{},
      trace6:{},

      headers: [
          {
            text: 'Production Line',
            align: 'start',
            sortable: false,
            value: 'name',
          },
          { text: 'Shift', value: 'shift' },
          { text: 'Part Number', value: 'partNumber' },
          { text: 'Supervisor', value: 'supervisor' },
          { text: 'Earned Hours', value: 'earnedHours' },
          { text: 'Scanned Hours', value: 'scannedHours' },
          { text: 'Paid Hours', value: 'paidHours' },
          { text: 'SDLE', value: 'sdle' },
          { text: 'PDLE', value: 'pdle' },
          { text: 'SHRA', value: 'shra' },
          { text: 'Availability', value: 'availability' },
          { text: 'Performance', value: 'performance' },
          { text: 'Quality', value: 'quality' },
          { text: 'OEE', value: 'oee' },
        ],
        food: [
          {
            name: 'Production Line 1',
            shift: 'Day',
            partNumber: 11211,
            supervisor: 'Allan J.',
            earnedHours: 100,
            scannedHours: 110,
            paidHours: 110,
            sdle: 0.92,
            pdle: 0.94,
            shra: 0.9,
            availability: 0.9,
            performance: 0.98,
            quality: 1,
            oee: 0.98
          },
          {
            name: 'Production Line 2',
            shift: 'Afternoon',
            partNumber: 11212,
            supervisor: 'Jack D.',
            earnedHours: 100,
            scannedHours: 110,
            paidHours: 110,
            sdle: 0.98,
            pdle: 0.97,
            shra: 0.99,
            availability: 0.9,
            performance: 0.98,
            quality: 1,
            oee: 0.93
          },{
            name: 'Production Line 3',
            shift: 'Night',
            partNumber: 11213,
            supervisor: 'Mark T.',
            earnedHours: 100,
            scannedHours: 110,
            paidHours: 110,
            sdle: 0.93,
            pdle: 0.94,
            shra: 0.96,
            availability: 0.9,
            performance: 0.98,
            quality: 1,
            oee: 0.95
          },{
            name: 'Production Line 4',
            shift: 'Day',
            partNumber: 11214,
            supervisor: 'Allan J.',
            earnedHours: 100,
            scannedHours: 110,
            paidHours: 110,
            sdle: 0.9,
            pdle: 0.93,
            shra: 0.96,
            availability: 0.9,
            performance: 0.98,
            quality: 1,
            oee: 0.92
          },{
            name: 'Production Line 5',
            shift: 'Afternoon',
            partNumber: 11215,
            supervisor: 'Jack D.',
            earnedHours: 100,
            scannedHours: 110,
            paidHours: 110,
            sdle: 0.91,
            pdle: 0.94,
            shra: 0.99,
            availability: 0.9,
            performance: 0.98,
            quality: 1,
            oee: 0.94
          },
          {
            name: 'Production Line 6',
            shift: 'Day',
            partNumber: 11216,
            supervisor: 'Allan J.',
            earnedHours: 100,
            scannedHours: 110,
            paidHours: 110,
            sdle: 0.92,
            pdle: 0.94,
            shra: 0.9,
            availability: 0.9,
            performance: 0.98,
            quality: 1,
            oee: 0.98
          },
          {
            name: 'Production Line 7',
            shift: 'Afternoon',
            partNumber: 11217,
            supervisor: 'Jack D.',
            earnedHours: 100,
            scannedHours: 110,
            paidHours: 110,
            sdle: 0.98,
            pdle: 0.97,
            shra: 0.99,
            availability: 0.9,
            performance: 0.98,
            quality: 1,
            oee: 0.93
          },{
            name: 'Production Line 8',
            shift: 'Night',
            partNumber: 11219,
            supervisor: 'Mark T.',
            earnedHours: 100,
            scannedHours: 110,
            paidHours: 110,
            sdle: 0.93,
            pdle: 0.94,
            shra: 0.96,
            availability: 0.9,
            performance: 0.98,
            quality: 1,
            oee: 0.95
          },{
            name: 'Production Line 9',
            shift: 'Day',
            partNumber: 11220,
            supervisor: 'Jason B.',
            earnedHours: 100,
            scannedHours: 110,
            paidHours: 110,
            sdle: 0.9,
            pdle: 0.93,
            shra: 0.96,
            availability: 0.9,
            performance: 0.98,
            quality: 1,
            oee: 0.92
          },{
            name: 'Production Line 10',
            shift: 'Afternoon',
            partNumber: 11221,
            supervisor: 'Henry D.',
            earnedHours: 100,
            scannedHours: 110,
            paidHours: 110,
            sdle: 0.91,
            pdle: 0.94,
            shra: 0.99,
            availability: 0.9,
            performance: 0.98,
            quality: 1,
            oee: 0.94
          },
        ],
    }),

    mounted () {
      //let myDiv = this.$refs.barChart2;
    },

    methods: {
      functionEvents (date) {
        const [,, day] = date.split('-')
        if ([12, 17, 28].includes(parseInt(day, 10))) return true
        if ([1, 19, 22].includes(parseInt(day, 10))) return ['red', '#00f']
        return false
      },
      start(){
        this.getBarChart1(),
        this.getBarChart2()
      },

      // bar chart 1
      getBarChart1(){
        /* var trace0 = {
          text: ['0.95'],
          mode: 'text',
          showlegend: false
        }; */

        var trace1 = {
          x: ['August 15'],
          y: [0.95],
          text: [0.95].map(String),
          name: 'Scanned Direct Labour Efficiency',
          type: 'bar'
        };

        var trace2 = {
          x: ['August 15'],
          y: [0.98],
          text: [0.98].map(String),
          name: 'Paid Direct Labour Efficiency',
          type: 'bar'
        };

        var trace3 = {
          x: ['August 15'],
          y: [0.95],
          text: [0.95].map(String),
          name: 'Scanned Hours Reporting Accuracy',
          type: 'bar'
        };

        var trace4 = {
          x: ['August 15'],
          y: [0.98],
          text: [0.98].map(String),
          name: 'Overall Equipment Effectiveness',
          type: 'bar'
        };

        var data = [trace1, trace2, trace3, trace4];

        var layout = {
          title: "Date",
          barmode: 'group',
          plot_bgcolor:"#121212",
          paper_bgcolor:"#121212",
          font: {
              size: 10,
              color: 'white'
            },
          legend:{
            traceorder: 'normal',
            font: {
              size: 10,
            },
            bgcolor: '#121212',
          },
          yaxis: {
            title: 'Values',
            margin: 10,
            padding: 0
          },
          margin: {
            l: 50,
            r: 50,
            b: 30,
            t: 30,
            pad: 4
          },
          shapes: [{
            type: 'line',
            text: '0.95',
            textposition: 'top right',
            x0: -1,
            y0: 0.9,
            x1: 1,
            y1: 0.9,
            line: {
              color: 'white'
            }
          }],
          height: 150,
          width: 1100
          };

        Plotly.newPlot('barChart1', data, layout);

        /* var values = [
          ['Salaries', 'Office', 'Merchandise', 'Legal', '<b>TOTAL</b>'],
          [1200000, 20000, 80000, 2000, 12120000],
          [1300000, 20000, 70000, 2000, 130902000],
          [1300000, 20000, 120000, 2000, 131222000],
          [1400000, 20000, 90000, 2000, 14102000]]

        var dataT = [{
          type: 'table',
          header: {
            values: [["<b>EXPENSES</b>"], ["<b>Q1</b>"],
                ["<b>Q2</b>"], ["<b>Q3</b>"], ["<b>Q4</b>"]],
            align: "center",
            line: {width: 1, color: 'black'},
            fill: {color: "grey"},
            font: {family: "Arial", size: 12, color: "white"}
          },
          cells: {
            values: values,
            align: "center",
            line: {color: "black", width: 1},
            font: {family: "Arial", size: 11, color: ["black"]}
          }
        }]

        Plotly.newPlot('plotlyTable', dataT); */
      },

      // bar chart 2
      getBarChart2(){
        var trace5 = {
          x: ['Day', 'Afternoon', 'Night'],
          y: [0.9, 0.98, 0.98, 0.97],
          text: [0.9, 0.98, 0.98, 0.97].map(String),
          name: 'Scanned Direct Labour Efficiency',
          type: 'bar'
        };

        var trace6 = {
          x: ['Day', 'Afternoon', 'Night'],
          y: [0.95, 0.97, 0.92, 0.94],
          text: [0.95, 0.97, 0.92, 0.94].map(String),
          name: 'Paid Direct Labour Efficiency',
          type: 'bar'
        };

        var trace7 = {
          x: ['Day', 'Afternoon', 'Night'],
          y: [0.92, 0.92, 0.94, 0.93],
          text: [0.92, 0.92, 0.94, 0.93].map(String),
          name: 'Scanned Hours Reporting Accuracy',
          type: 'bar'
        };

        var trace8 = {
          x: ['Day', 'Afternoon', 'Night'],
          y: [0.93, 0.9, 0.9, 0.9],
          text: [0.93, 0.9, 0.9, 0.9].map(String),
          name: 'Overall Equipment Effectiveness',
          type: 'bar'
        };

        var data = [trace5, trace6, trace7, trace8];

        var layout = {
          title: "Shift",
          barmode: 'group',
          showlegend: false,
          plot_bgcolor:"#121212",
          paper_bgcolor:"#121212",
          font: {
              size: 10,
              color: 'white'
            },
          legend:{
            traceorder: 'normal',
            font: {
              size: 10,
            },
            bgcolor: "#121212"
          },
          yaxis: {
            title: 'Values',
            margin: 10,
            padding: 0
          },
          margin: {
            l: 50,
            r: 50,
            b: 30,
            t: 30,
            pad: 4
          },
          shapes: [{
            type: 'line',
            x0: -1,
            y0: 0.9,
            x1: 3,
            y1: 0.9,
            line: {
              color: 'white'
            }
          }],
          height: 150,
          width: 900
          };

        Plotly.newPlot('barChart2', data, layout);

        // click bar chart 2
        var barChart2 = document.getElementById('barChart2');
        barChart2.on('plotly_click', function(data){
          var trace9 = {
          x: ['Production Line 1', 'Production Line 2', 'Production Line 3', 'Production Line 4', 'Production Line 5', 'Production Line 6'],
          y: [0.93, 0.95, 0.9, 0.9, 0.92, 0.93],
          text: [0.93, 0.95, 0.9, 0.9, 0.92, 0.93].map(String),
          name: 'Scanned Direct Labour Efficiency',
          type: 'bar'
        };

        var trace10 = {
          x: ['Production Line 1', 'Production Line 2', 'Production Line 3', 'Production Line 4', 'Production Line 5', 'Production Line 6'],
          y: [0.9, 0.93, 0.93, 0.94, 0.94, 0.97],
          text: [0.9, 0.93, 0.93, 0.94, 0.94, 0.97].map(String),
          name: 'Paid Direct Labour Efficiency',
          type: 'bar'
        };

        var trace11= {
          x: ['Production Line 1', 'Production Line 2', 'Production Line 3', 'Production Line 4', 'Production Line 5', 'Production Line 6'],
          y: [0.97, 0.9, 0.95, 0.97, 0.93, 0.92],
          text: [0.97, 0.9, 0.95, 0.97, 0.93, 0.92].map(String),
          name: 'Scanned Hours Reporting Accuracy',
          type: 'bar'
        };

        var trace12 = {
          x: ['Production Line 1', 'Production Line 2', 'Production Line 3', 'Production Line 4', 'Production Line 5', 'Production Line 6'],
          y: [0.95, 0.98, 0.98, 0.92, 0.9, 0.8],
          text: [0.95, 0.98, 0.98, 0.92, 0.9, 0.8].map(String),
          name: 'Overall Equipment Effectiveness',
          type: 'bar'
        };

        var data = [trace9, trace10, trace11, trace12];

        var layout = {
          title: "Production Line",
          barmode: 'group',
          showlegend: false,
          plot_bgcolor:"#121212",
          paper_bgcolor:"#121212",
          font: {
              size: 10,
              color: 'white'
            },
          legend:{
            traceorder: 'normal',
            font: {
              size: 10,
            },
            bgcolor: '#121212'
          },
          yaxis: {
            title: 'Values',
            margin: 10,
            padding: 0
          },
          margin: {
            l: 50,
            r: 50,
            b: 30,
            t: 30,
            pad: 4
          },
          shapes: [{
            type: 'line',
            x0: -1,
            y0: 0.9,
            x1: 6,
            y1: 0.9,
            line: {
              color: 'white'
            }
          }],
          height: 150,
          width: 900
          };

        Plotly.newPlot('barChart3', data, layout);

        // click bar chart 3
        var barChart3 = document.getElementById('barChart3');
        barChart3.on('plotly_click', function(data){
        var trace13={
          x: ['Work Station 1', 'Work Station 2', 'Work Station 3'],
          y: [0.9, 0.98, 0.98, 0.97],
          text: [0.9, 0.98, 0.98, 0.97].map(String),
          name: 'Scanned Direct Labour Efficiency',
          type: 'bar'
        };

        var trace14 = {
          x: ['Work Station 1', 'Work Station 2', 'Work Station 3'],
          y: [0.95, 0.97, 0.92, 0.94],
          text: [0.95, 0.97, 0.92, 0.94].map(String),
          name: 'Paid Direct Labour Efficiency',
          type: 'bar'
        };

        var trace15 = {
          x: ['Work Station 1', 'Work Station 2', 'Work Station 3'],
          y: [0.92, 0.92, 0.94, 0.93],
          text: [0.92, 0.92, 0.94, 0.93].map(String),
          name: 'Scanned Hours Reporting Accuracy',
          type: 'bar'
        };

        var trace16 = {
          x: ['Work Station 1', 'Work Station 2', 'Work Station 3'],
          y: [0.93, 0.9, 0.9, 0.9],
          text: [0.93, 0.9, 0.9, 0.9].map(String),
          name: 'Overall Equipment Effectiveness',
          type: 'bar'
        };

        var data = [trace13, trace14, trace15, trace16];

        var layout = {
          title: "Work Station",
          barmode: 'group',
          showlegend: false,
          plot_bgcolor:"#121212",
          paper_bgcolor:"#121212",
          font: {
              size: 10,
              color: 'white'
            },
          legend:{
            traceorder: 'normal',
            font: {
              size: 10,
            },
            bgcolor: '#121212'
          },
          yaxis: {
            title: 'Values',
            margin: 10,
            padding: 0
          },
          margin: {
            l: 50,
            r: 50,
            b: 30,
            t: 30,
            pad: 4
          },
          shapes: [{
            type: 'line',
            x0: -1,
            y0: 0.9,
            x1: 3,
            y1: 0.9,
            line: {
              color: 'white'
            }
          }],
          height: 150,
          width: 900
          };

        Plotly.newPlot('barChart4', data, layout); 

        // click bar chart 4
        var barChart4 = document.getElementById('barChart4');
        barChart4.on('plotly_click', function(data){
          var trace17={
          x: ['Employee A', 'Employee B', 'Employee C'],
          y: [0.9, 0.98, 0.92, 0.97],
          text: [0.9, 0.98, 0.92, 0.97].map(String),
          name: 'Scanned Direct Labour Efficiency',
          type: 'bar'
        };

        var trace18 = {
          x: ['Employee A', 'Employee B', 'Employee C'],
          y: [0.95, 0.97, 0.98, 0.94],
          text: [0.95, 0.97, 0.98, 0.94].map(String),
          name: 'Paid Direct Labour Efficiency',
          type: 'bar'
        };

        var trace19 = {
          x: ['Employee A', 'Employee B', 'Employee C'],
          y: [0.92, 0.92, 0.95, 0.93],
          text: [0.92, 0.92, 0.95, 0.93].map(String),
          name: 'Scanned Hours Reporting Accuracy',
          type: 'bar'
        };

        var trace20 = {
          x: ['Employee A', 'Employee B', 'Employee C'],
          y: [0.93, 0.93, 0.92, 0.98],
          text: [0.93, 0.93, 0.92, 0.98].map(String),
          name: 'Overall Equipment Effectiveness',
          type: 'bar'
        };

        var data = [trace17, trace18, trace19, trace20];

        var layout = {
          title: "Employee",
          barmode: 'group',
          showlegend: false,
          plot_bgcolor:"#121212",
          paper_bgcolor:"#121212",
          font: {
              size: 10,
              color: 'white'
            },
          legend:{
            traceorder: 'normal',
            font: {
              size: 10,
            },
            bgcolor: '#121212'
          },
          yaxis: {
            title: 'Values',
            margin: 10,
            padding: 0
          },
          margin: {
            l: 50,
            r: 50,
            b: 30,
            t: 30,
            pad: 4
          },
          shapes: [{
            type: 'line',
            x0: -1,
            y0: 0.9,
            x1: 3,
            y1: 0.9,
            line: {
              color: 'white'
            }
          }],
          height: 150,
          width: 900
          };

        Plotly.newPlot('barChart5', data, layout); 
        });
        });
        });

        

      },

      /* getBarChart3(){
        var trace5 = {
          x: ['giraffes', 'orangutans', 'monkeys'],
          y: [20, 14, 23],
          name: 'SF Zoo',
          type: 'bar'
        };

        var trace6 = {
          x: ['giraffes', 'orangutans', 'monkeys'],
          y: [12, 18, 29],
          name: 'LA Zoo',
          type: 'bar'
        };

        var data = [trace5, trace6];

        var layout = {
          title: "Shift",
          barmode: 'group',
          plot_bgcolor:"9E9E9E",
          paper_bgcolor:"9E9E9E",
          font: {
              size: 10,
              color: 'white'
            },
          legend:{
            traceorder: 'normal',
            font: {
              size: 10,
            },
            bgcolor: "9E9E9E"
          },
          height: 300,
          margin: 50
          };

        Plotly.newPlot('barChart3', data, layout);
      }, */
    },
}
</script>

