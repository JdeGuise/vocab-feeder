import { render, screen } from "@testing-library/react";
import VocabFeederApp from "./VocabFeederApp";

test("renders learn react link", () => {
  render(<VocabFeederApp />);
  const linkElement = screen.getByText(/learn react/i);
  expect(linkElement).toBeInTheDocument();
});
