import * as React from "react"
const Windmill = (props: any) => (
  <svg
    xmlns="http://www.w3.org/2000/svg"
    data-name="Layer 1"
    style={{
      display: "block",
      margin: "0 auto",
      maxWidth: 700,
    }}
    viewBox="0 0 100 100"
    {...props}
  >
    <defs>
      <style>
        {
          "@keyframes scroll{0%{transform:translateX(-50px)}to{transform:translateX(150px)}}.cls-2{fill:none}.cls-2,.cls-7{stroke:#fdc029;stroke-linejoin:round;stroke-linecap:round}.cls-5,.cls-7{fill:#171820}.cls-4{fill:#333}"
        }
      </style>
    </defs>
    <path
      fill="#aa3d01"
      d="M90.5 63.1a40 40 0 1 0-76.4 16.5h72.8a39.9 39.9 0 0 0 3.6-16.4z"
    />
    <path d="M11 79.7h78m-82.5 0H9m82 0h2.5" className="cls-2" />
    <path
      fill="#fff"
      stroke="#bcb6ae"
      strokeLinejoin="round"
      d="M29.3 35.7a2.1 2.1 0 0 0-.8.2 3.7 3.7 0 0 0-7.3 0 2 2 0 0 0-.8-.2 2.2 2.2 0 0 0 0 4.4h8.9a2.2 2.2 0 0 0 0-4.4z"
      style={{
        transform: "translateX(150px)",
        animation: "scroll 20s infinite linear",
      }}
    />
    <path
      d="M64.5 48.8a1 1 0 0 0 1-1.3l-1.6-4.1a11 11 0 0 0-4.6-5.5l-6-3.7a1 1 0 0 0-1 0l-6 3.7a11 11 0 0 0-4.5 5.5l-1.5 4a1 1 0 0 0 .9 1.4z"
      className="cls-4"
    />
    <path
      d="M64.5 48.8a1 1 0 0 0 1-1.3l-1.6-4.1a11 11 0 0 0-4.6-5.5l-6-3.7a1 1 0 0 0-1 0l-6 3.7a11 11 0 0 0-4.5 5.5l-1.5 4a1 1 0 0 0 .9 1.4z"
      className="cls-2"
    />
    <path d="M41 48.8h23.5v3.8H41z" className="cls-4" />
    <path d="M41 48.8h23.5v3.8H41z" className="cls-2" />
    <path
      d="M69 72.8a1 1 0 0 0 .9-1.5 31 31 0 0 1-4-15.1v-2.6a1 1 0 0 0-1-1H40.6a1 1 0 0 0-1 1v2.6a30.9 30.9 0 0 1-4 15.1 1 1 0 0 0 1 1.5z"
      className="cls-4"
    />
    <path
      d="M69 72.8a1 1 0 0 0 .9-1.5 31 31 0 0 1-4-15.1v-2.6a1 1 0 0 0-1-1H40.6a1 1 0 0 0-1 1v2.6a30.9 30.9 0 0 1-4 15.1 1 1 0 0 0 1 1.5z"
      className="cls-2"
    />
    <path d="M37.5 72.8H68v6.8H37.5z" className="cls-5" />
    <path d="M37.5 72.8H68v6.8H37.5z" className="cls-2" />
    <rect
      width={6}
      height={7.5}
      x={43}
      y={61.6}
      className="cls-4"
      rx={1}
      ry={1}
    />
    <path d="M48 61.6h-4a1 1 0 0 0-1 1v5.5a1 1 0 0 0 .6 1z" className="cls-5" />
    <rect
      width={6}
      height={7.5}
      x={43}
      y={61.6}
      className="cls-2"
      rx={1}
      ry={1}
    />
    <path d="M43 65.4h6m-3-3.8v7.6" className="cls-2" />
    <path
      stroke="#fdc029"
      strokeLinecap="round"
      strokeLinejoin="round"
      d="M61 79.7h-4.5v-3a2.3 2.3 0 0 1 2.3-2.3 2.3 2.3 0 0 1 2.2 2.3z"
    />
    <path d="M43.5 79.7v-3.8m7 3.8v-3.8" className="cls-2" />
    <g className="windmills">
      <animateTransform
        attributeName="transform"
        dur="10s"
        from="0 53 42.5"
        repeatDur="indefinite"
        to="360 53 42.5"
        type="rotate"
      />
      <path
        d="m49.2 38.9 5.2-5.2a1 1 0 0 0 0-1.5L42.8 20.6a1 1 0 0 0-1.4 0l-4 4a1.8 1.8 0 0 0 0 2.5l30.7 30.6a1.8 1.8 0 0 1 0 2.6l-4 4a1 1 0 0 1-1.4 0L51.1 52.5a1 1 0 0 1 0-1.4l5.2-5.2"
        className="cls-2"
      />
      <path
        d="M49.2 46 44 40.8a1 1 0 0 0-1.4 0L31 52.4a1 1 0 0 0 0 1.4l4 4a1.8 1.8 0 0 0 2.5 0L68 27a1.8 1.8 0 0 1 2.5 0l4 4a1 1 0 0 1 .3.7 1 1 0 0 1-.3.7L63 44a1 1 0 0 1-1.4 0l-5.2-5.2"
        className="cls-2"
      />
      <path
        d="m68 60.3-1.2 1.2-13-13 2.5-2.5 11.8 11.7a1.8 1.8 0 0 1 0 2.6zM51.8 36.4l-2.6 2.5L37.5 27a1.8 1.8 0 0 1 0-2.5l1.2-1.3zM35 57.7l-1.3-1.2 13-13 2.5 2.5-11.7 11.7a1.8 1.8 0 0 1-2.6 0zm23.9-16.3L56.3 39l11.8-12a1.8 1.8 0 0 1 2.5 0l1.3 1.3z"
        className="cls-7"
      />
      <path
        d="m57 58.5 3.4-3.4m0 6.8 3.4-3.4m-10.2-3.4 3.4-3.4M45.2 29.8l3.4-3.4m0 6.7 3.4-3.3m-10.2-3.4 3.4-3.4m23.6 15.2-3.4-3.4m.1 6.8-3.4-3.4m10.1-3.3-3.4-3.4M39.9 50.2l-3.4-3.4m.1 6.8-3.4-3.4m10.1-3.4-3.4-3.3"
        className="cls-2"
      />
    </g>
    <rect
      width={4.5}
      height={4.5}
      x={50.5}
      y={40.2}
      className="cls-7"
      rx={1}
      ry={1}
    />
  </svg>
)
export default Windmill;