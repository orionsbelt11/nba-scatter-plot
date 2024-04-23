<script>
    import {format} from "d3-format";
    export let data;
    export let xScale;
    export let yScale;
    export let width;

    $: x = xScale(data.pop2020)
    $: y = yScale(data.players)

    const xNudge =20;
    const yNudge = 15;

    $: xPosition = x + xNudge;
    $: yPosition = y - yNudge;

    let tooltipFormat = format(".2s");

    function simpleFormat(input) {
        return (input / 1000000).toFixed(1)
    } 


</script>

<div class="tooltip"
     style="position: absolute; top: {yPosition}px; left: {xPosition}px"
     bind:clientWidth={width}>
    <h1>{data.state}</h1>
    <br/>
    <h2>Players: {data.players}</h2>
    <br/>
    <h2>Residents: {simpleFormat(data.pop2020)} million</h2>
</div>

<style>
    .tooltip {
        background: #fefbfb;
        box-shadow: rgba(0, 0 , 0, 0.1 ) 2px 3px 8px;
        transition: top 300ms ease, left 300ms ease;
        padding: 8px 6px;
    }

    .tooltip h1 {
        font-weight: 700;
    }
</style>