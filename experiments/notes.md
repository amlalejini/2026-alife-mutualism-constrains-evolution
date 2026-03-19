# Notes from experiments / tinkering

## Big picture next steps

- Alife papers setup
  -
- Mutualist <--> parasite spectrum (implement interaction value / instruction-based)
- Changing environment / spatial structure / multi-infection
  - Repeat experiments in ALife

## For stress mutualists / parasites:

- When ousting, whether we favor current symbiont vs incoming symbiont matters.
  - For mutualist, important that VT is main mechanism of repro, so important that current symbiont is favored (to maintain relationship with host).
  - For parasite, important that HT is main mechanism of repro, better for incoming symbiont to be favored.
- When using strictly stronger matches for ousting, need to give hosts enough time between stress events to replenish population.
  - When using stronger or equal, it helps the host that they often get "new" offspring that haven't expressed any tasks yet, giving them a pass for that stress event.

```
Funky(?) observation from tinkering with settings for stress mutualists yesterday. I'm finding that the details of how we handle preferential ousting matters quite a bit (at least in the context of how I have all the other parameters configured). One thing we talked about previously that I've been using is when a symbiont tries to infect a host, it can only oust another symbiont if the incoming symbiont's parent has at least as strong of a task match as the current symbiont in the focal host. The choice of "at least as strong" vs "strictly stronger" does seem to matter :thinking_face:

Letting symbionts oust when they have "at least as strong" of a task match as the current symbiont in the focus host favors incoming symbionts => results in a much greater number of  successful horizontal transmissions => higher generational turnover => ends up being beneficial to stress parasite evolution. This funkily also ends up benefiting hosts when in the presence of stress parasites + when using current task profiles (vs. parent's) to determine stress interaction => more frequently getting "new" infections can shield more hosts from the stress event because the new symbiont is less likely to have expressed their task(s). This ends up making host-parasite co-evolution pretty stable/robust under a wider range of stress frequencies / harshnesses. But, this ousting configuration destabilizes host-mutualist co-evolution because horizontal transmission ends up being the dominate form of symbiont reproduction (vs vertical transmission), and "new" mutualist infections increase the likelihood that the host dies because their mutualist is less likely to have expressed any protective tasks.

Setting up ousting to require incoming symbionts to have a "strictly stronger" match favors symbionts already in their hosts. This can destabilize host-parasite coevolution because hosts no longer get as many "new" infections where their parasite hasn't expressed tasks yet => more hosts die each stress event, and population sizes are small / unstable. This stabilizes mutualist-host coevolution because matching symbionts transmitted vertically aren't immediately replaced by a symbiont trying to infect horizontally.

Using parent task performance for interactions instead of the current organism task performance makes this less of an effect, but does still make host-parasite coevolution less robust because new infections will always have tasks from their parents to interact with. Also anecdotally have found that using parent task profiles makes it harder for hosts/parasites to move up the task complexity chain by delaying when selection can act on new task discoveries by a generation.

I think I can still get sustained host-parasite coevolution with the "strictly stronger" mode of ousting by increasing stress frequency (to maintain strong selection pressure for hosts escaping and parasites chasing) but decreasing the death chance caused by parasites so that the host population doesn't get too small.
```

## For variable task rewards

Context: no symbionts.
- For higher value tasks to matter, needs to be worth it for hosts to spend extra
  cpu cycles/genome space to perform high complexity task for extra resources.
- I.e., hosts need to be resource limited to some extent. Or, need to be a selective benefit to accumulating more resources more efficiently.
- Challenging to balance resource limit with minimum lifespan requirement.
  - E.g., need to substantially increase resource requirements for reproduction + remove or increase maximum age.


## Experiments still needed:

- Stress
  - Task restrictions: Try with limiting both hosts and parasites to one task and allowing both hosts and parasites to do multiple different tasks.
  - Try reducing repro resources to require just one task.
