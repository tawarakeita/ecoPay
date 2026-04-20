import ReactMarkdown from 'react-markdown';
import fs from 'fs';
import path from 'path';

export default function PrivacyPolicyPage() {
  const fullPath = path.join(process.cwd(), 'public/privacy-policy.md');

  const content = fs.readFileSync(fullPath, 'utf8');

  return (
    <main className="p-10">
      <article className="prose prose-slate max-w-none">
        <ReactMarkdown>{content}</ReactMarkdown>
      </article>
    </main>
  );
}
