"use client";
import { useState } from "react";

type QAItem = { q: string; a: string };

export default function QAAccordion({ items }: { items: QAItem[] }) {
  const [openIndex, setOpenIndex] = useState<number | null>(null);

  return (
    <div className="w-full m-auto">
      {items.map((item, i) => (
        <div key={i} className="border-b">
          <button
            type="button"
            className="w-full flex justify-between items-center py-4 text-left cursor-pointer"
            onClick={() => setOpenIndex(openIndex === i ? null : i)}
            id={`qa-heading-${i}`}
            aria-controls={`qa-content-${i}`}
            ref={(el) => {
              if (el) {
                el.setAttribute('aria-expanded', openIndex === i ? 'true' : 'false');
              }
            }}
          >
            <span className="text-lg font-medium">{item.q}</span>
            <span className="text-2xl ml-2">{openIndex === i ? '−' : '+'}</span>
          </button>
          {openIndex === i && (
            <div id={`qa-content-${i}`} role="region" aria-labelledby={`qa-heading-${i}`} className="pb-4 text-sm text-gray-700">
              {item.a}
            </div>
          )}
        </div>
      ))}
    </div>
  );
}
