<script>
    export let yScale;
    export let width;
    export let height;

    let yTicks = [0, 15, 30, 45]
    let fullWidth = width + 30;
</script>

<g class="axis-y">
    {#each yTicks as tick, index}
        <g class="tick" transform="translate(0, {yScale(tick)})">
            <line x1={0} x2={width} y1={0} y2={0} stroke={index === 0 ? '#8f8f8f' : '#e5e7eb'} /> 
            <text y={-3}>{index === yTicks.length - 1 ? `${tick} NBA players born in state` : (index === 0 ? "" : tick)}</text>
        </g>
    {/each}
    <text></text>
</g>