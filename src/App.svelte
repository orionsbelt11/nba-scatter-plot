<script>
import AxisX from "$components/AxisX.svelte"
import AxisY from "$components/AxisY.svelte"
import { scaleLinear } from "d3-scale"
import { max } from "d3-array"
import data from "$data/nba_per_cap.js"
import Tooltip from "./components/Tooltip.svelte"

let width = 400;
let height = 400;

const margin = { top: 50, right: 50, bottom: 20, left: 10};
const radius = 10;

$: innerWidth = width - margin.left - margin.right;
let innerHeight = height - margin.top - margin.bottom;


$: xScale = scaleLinear()
  .domain([0, max(data, d => d.pop2020)])
  .range([0, innerWidth]);


let yScale = scaleLinear()
  .domain([0, max(data, d=> d.players)])
  .range([innerHeight, 0]);

let hoveredData;

</script>

<h1>Which states send the most players to the NBA per capita?</h1>
<h2>Current NBA players born in state compared to 2020 population</h2>
<div
  class="chart-container"
  bind:clientWidth={width}>
  <svg {width} {height} on:mouseleave={() => hoveredData = null}>
    <g class="inner-chart" transform="translate({margin.left}, {margin.top})"> 
      <AxisX height={innerHeight} width={innerWidth} {xScale} />
      <AxisY width={innerWidth} {yScale} />
      {#each data as d}
        <circle
          cx={xScale(d.pop2020)}
          cy={yScale(d.players)}
          r=10
          opacity={hoveredData ? (hoveredData == d ? 1: 0.45) : 0.85}
          fill="#f5b326"
          stroke="black"
          on:mouseover={() => hoveredData = d} />
      {/each}
    </g>
  </svg>
  {#if hoveredData}
    <Tooltip {xScale} {yScale} {width} data={hoveredData} />
  {/if}
</div>

<style>
  .chart-container {
    position: relative;
  }

  :global(.tick text, .axis-title) {
    font-weight: 400;;
    font-size: 14px;
    fill: hsla(212, 10%, 53%, 1);
  }

  h1 {
    margin: 0 0 0.5rem 0;
    font-size: 1.8rem;
    font-weight: 600;
    font-family: "Space Grotesk";
  }

  h2 {
    margin: 0 0 0.5rem 0;
    font-size: 1.2rem;
    font-weight: 400;
    font-family: "Space Grotesk";
  }

</style>