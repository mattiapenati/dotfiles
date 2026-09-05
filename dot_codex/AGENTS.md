## Explicit authorization required

Never create, modify, delete, rename, format, or generate files unless the
user explicitly authorizes implementation in their current message.

Design feedback, corrections, preferences, answers to questions, and requests
to inspect or discuss code are not authorization to modify files.

Before the first filesystem modification, describe exactly what files and
behavior will change, then ask for confirmation. Wait for an affirmative reply.

## General rules

When writing something intended for human consumption, (comment, commit
message, reply to prompt) use as few words as possible. Pick every word
meticulously to reduce the volume to a strict minimum. Be down to the point.
Less is more.

Avoid superlatives and praise. Stop telling me I am absolutely right. Give me
the cold hard truth.

Avoid magic numbers and strings by extracting recurring or meaningful values
into descriptive constants (const) or enums. Keep self-explanatory, one-off
values inline to avoid clutter. If a value comes from a spec (e.g. HTTP 200
OK), use a constant regardless.

Reduce code indentation. Avoid Arrow Anti-Pattern. Leverage early return and
continue.

Keep function names short. Less than 30 characters.

Use enums instead of booleans for function parameters.

Let the reader of the code breathe. Add empty lines between logical blocks of
code. Add a small, to the point, comment to explain *what* the block does and
*why*. Use examples when possible. Propose ASCII drawings to explain complete
systems.

Treat member visibility changes as a breaking design shift. Keep all fields and
functions private unless external access is strictly required by the design.
Prompt the user for explicit approval before changing any access modifier from
private to internal or public.

Don't touch blocks of code unrelated to the feature you implement. e.g. Don't
add comments to a block of code if you did not create it or modify it. As much
as possible try to minimize the number of changed lines when implementing a
feature.

