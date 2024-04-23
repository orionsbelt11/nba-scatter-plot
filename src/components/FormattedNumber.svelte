<script>
	export let tick;
	let locale = "en";

	$: FormattedNumber = tick.toLocaleString(locale, {
		notation: "compact",
		compactDisplay: "short"
	});
</script>

<style>
	span {
		font-variant-numeric: tabular-nums;
	}
</style>

<span>{FormattedNumber}</spanMy >


