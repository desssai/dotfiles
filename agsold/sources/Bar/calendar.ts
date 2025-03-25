const date = Variable("", {
  poll: [1000, `date '+%a %b %e  %H:%M'`],
});

export function Clock() {
  return Widget.Label({
    className: "clock",
    label: date.bind(),
  });
}
