<script>
    import {format} from "d3-format";
    export let xScale;
    export let width;
    export let height;

    let xTicks = [0, 10000000, 20000000, 30000000, 40000000]

    let xFormat = format(".1s");
</script>

<g class="axis-x" transform="translate(0, {height})">
    {#each xTicks as tick, index}
        <g class='tick' transform="translate({xScale(tick)}, 0)">
           <line x1={0} x2={0} y1={0} y2={6} stroke="black"/>
           <text y=12 dy=9 
           text-anchor={index === 0 ? 'middle' : (index === xTicks.length - 1 ? 'end' : 'middle')}>
           {index == xTicks.length - 1 ? "40 Million" : xFormat(tick)}
        </text>
        </g>
    {/each}
    <text class="axis-title" x={width} y={-9} text-anchor="end">State population in 2020</text>
</g>


<style>

</style>

